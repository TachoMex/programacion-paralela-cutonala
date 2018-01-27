module TODOList
  module Controller
    class User
      def self.from_id(id)
        new(id)
      end

      def initialize(username)
        @username = username
      end

      def id
        @username
      end
    end
  end
end
