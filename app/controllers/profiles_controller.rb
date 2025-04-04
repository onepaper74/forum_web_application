class ProfilesController < ApplicationController
    before_action :require_login
      before_action :set_profile, only: [:show, :edit, :update]
      before_action :authorize_owner!, only: [:edit, :update]

      def show
      end

      def edit
      end

      def update
        if @profile.update(profile_params)
          redirect_to profile_path(@profile), notice: "The profile has been updated."
        else
          render :edit
        end
      end

      private

      def set_profile
        @profile = Profile.find(params[:id])
      end

      def authorize_owner!
        redirect_to root_path, alert: "No permission!" unless @profile.user == current_user
      end

      def profile_params
        params.require(:profile).permit(:department, :intro)
      end
end
