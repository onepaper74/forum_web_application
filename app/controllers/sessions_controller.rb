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
        flash.now[:alert] = "Invalid email/password combination!"
        puts "FLASH ALERT: #{flash[:alert]}"
        render :new
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to root_path, notice: "You have been logged out"
    end
end
