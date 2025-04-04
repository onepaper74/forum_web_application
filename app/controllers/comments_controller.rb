class CommentsController < ApplicationController
    before_action :require_login
      before_action :set_post

      def create
        @comment = @post.comments.build(comment_params)
        @comment.user = current_user
        if @comment.save
          redirect_to post_path(@post), notice: "Comment successfully!"
        else
          redirect_to post_path(@post), alert: "Failed."
        end
      end

      def destroy
        @comment = @post.comments.find(params[:id])
        if @comment.user == current_user
          @comment.destroy
          redirect_to post_path(@post), notice: "This comment has been deleted!"
        else
          redirect_to post_path(@post), alert: "You are not permitted to delete."
        end
      end

      private

      def set_post
        @post = Post.find(params[:post_id])
      end

      def comment_params
        params.require(:comment).permit(:content)
      end
end
