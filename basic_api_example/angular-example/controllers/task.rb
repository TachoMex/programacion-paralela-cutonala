module TODOList
  module Controller
    class Task
      extend DependencyInjector

      def self.by_user(user)
        db = resource(:db)
        db.where(user: user.id).map { |task| new(task) }
      end

      def self.create(description)
        task = new(user: nil, status: false, description: description)
        task.store
        task
      end

      def self.from_id(id)
        db = resource(:db)
        data = db.where(task_id: id).first
        raise('Not found') if data.nil?
        new(data)
      end

      def initialize(data)
        @data = data
      end

      def assign(user)
        @data[:user] = user.id
      end

      def store
        db = self.class.resource(:db)
        if @data[:task_id].nil?
          @data[:task_id] = db.insert(@data)
        else
          db.where(task_id: @data[:task_id])
            .update(status: @data[:status],
                    user: @data[:user])
        end
        @data
      end

      def status=(new_status)
        @data[:status] = new_status
      end

      def assert_user!(user)
        raise('Wrong User') if user.id != @data[:user]
      end

      def to_json(opt)
        @data.to_json(opt)
      end
    end
  end
end
