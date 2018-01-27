require './controllers/task'
require './controllers/user'
module TODOList
  module Routes
    class TODOList < Grape::API
      include Controller
      namespace :todo do
        route_param :user do
          get do
            process_request do
              user = User.from_id(params[:user])
              Task.by_user(user)
            end
          end

          post do
            process_request do
              puts params[:description]
              user = User.from_id(params[:user])
              task = Task.create(params[:description])
              task.assign(user)
              task.store
            end
          end

          route_param :task do
            patch do
              process_request do
                user = User.from_id(params[:user])
                task = Task.from_id(params[:task])
                task.assert_user!(user)
                task.status = params[:status]
                task.store
              end
            end
          end
        end
      end
    end
  end
end
