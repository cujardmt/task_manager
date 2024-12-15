class SessionsController < ApplicationController
    
    def new
      # show login form
    end

    # 1. autehticate user
    # 2. create user session
    def create
        user = User.authenticate(params[:username], params[:password])
        if user
          session[:user_id] = user.id
          # display tasks of the logged in user
          redirect_to tasks_path
        else
          flash.now[:alert] = "Invalid username or password"
          render :new
        end
      end
    
      def destroy
        session[:user_id] = nil
        redirect_to login_path, notice: "Logged out successfully!"
      end
end
