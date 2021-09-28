class PostsController < ApplicationController
  before_action :post, only: [:show, :edit, :update, :destroy]
  before_action :comments, only: [:show]
  respond_to :html

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  def edit
  end

  def update
    flash[:notice] = "Post was successfully updated." if @post.update(post_params)
    respond_with(@post)
  end

  def new
    @post = Post.new
    @post.comments.new
  end

  def create
    @post = Post.create(post_params)
    flash[:notice] = 'Post was successfully created.' if @post.save
    respond_with(@post)
  end

  def destroy
    @post.destroy
    flash[:notice] = "Post was successfully destroyed."
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :author, comments_attributes: [:body])
  end

  def post
    @post = Post.find(params[:id])
  end

  def comments
    @comments = @post.comments
  end
end
