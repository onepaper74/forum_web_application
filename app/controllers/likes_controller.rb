class LikesController < ApplicationController
    before_action :require_login
    before_action :set_post

    def create
      unless @post.liked_users.include?(current_user)
         @post.likes.create(user: current_user)
      end
        redirect_to post_path(@post)
    end

    def destroy
       like = @post.likes.find_by(user: current_user)
       like&.destroy
       redirect_to post_path(@post)
    end

      private

      def set_post
        @post = Post.find(params[:post_id])
      end
end
