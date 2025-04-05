class SessionsController < ApplicationController
    layout 'application'
    
    def new
    end

    def create
      user = User.find_by(email: params[:email])
      if user&.authenticate(params[:password])
        session[:user_id] = user.id       
        redirect_to root_path, notice: "Logged in successfully！Welcome #{user.username}"
      else
          if Rails.env.production?
            flash[:alert] = "Invalid email/password combination!"
            redirect_to login_path
          else
            flash.now[:alert] = "Invalid email/password combination!"
            render :new, layout: "application"
          end
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to root_path, notice: "You have been logged out"
    end
end
