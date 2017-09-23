require 'grape'




module Routes
  class Auth < Grape::API
    namespace :sites do
      route_param :site do
        # POST /api/sites/:site/auth
        post :auth do
          process_request do
            user = params[:user]
            pass = params[:pass]
            site = params[:site]
            auth = Controller::Auth.new(site, user, pass)
            auth.validate
          end
        end
      end
    end
  end
end
