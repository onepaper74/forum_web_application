class UsersController < ApplicationController
    def new
        @user = User.new
        @user.build_profile
    end

    def create
        @user = User.new(user_params)
       if @user.save
          session[:user_id] = @user.id
          redirect_to root_path, notice: "Successful registration, welcome  #{@user.username}!"
       else
          flash.now[:alert] = "Something wrong happened. Please try again."
          render :new
       end
    end


    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation, profile_attributes: [:department, :intro])
    end
    
end
