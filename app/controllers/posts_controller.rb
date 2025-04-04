class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    before_action :require_login, except: [:index, :show]
    before_action :authorize_post_owner!, only: [:edit, :update, :destroy]
    
    
    # GET /posts
    def index
      @posts = Post.includes(:user).order(created_at: :desc)
    end

    # GET /posts/:id
    def show
      @comment = Comment.new
    end

    # GET /posts/new
    def new
      @post = Post.new
    end

    # POST /posts
    def create
      @post = current_user.posts.build(post_params)
      if @post.save
        redirect_to @post, notice: "Post created successfully!"
      else
    render :new, alert: "Something went wrong!"
      end
    end

    # GET /posts/:id/edit
    def edit
        @post = Post.find(params[:id])
    end

    # PATCH/PUT /posts/:id
    def update
      if @post.update(post_params)
        redirect_to @post, notice: "Post was updated successfully!"
      else
        render :edit
      end
    end

    # DELETE /posts/:id
    def destroy
      @post.destroy
      redirect_to posts_path, notice: "Post has been deleted."
    end

    private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content)
    end

    def authorize_post_owner!
      unless @post.user == current_user
        redirect_to posts_path, alert: "You are not authorized to modify this post."
      end
    end
    
end
