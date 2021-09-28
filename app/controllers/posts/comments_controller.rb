module Posts
  class CommentsController < ApplicationController
    before_action :comment, only: [:update, :destroy]
    before_action :post
    respond_to :html

    def edit
      @post
    end

    def update
      if @comment.update(comment_params)
        flash[:notice] = "Comment was successfully updated."
      end
      respond_with(@post)
    end

    def create
      @comment = Comment.create(comment_params)
      @comment.post = @post
      flash[:notice] = "Comment was successfully created." if @comment.save
      respond_with(@post)
    end
  
    def destroy
      @comment.destroy
      flash[:notice] = "Comment was successfully destroyed."
      redirect_to @post
    end

    private

    def comment_params
      params.require(:comment).permit(:body, :post_id, :author)
    end

    def post
      @post = Post.find(params[:post_id])
    end

    def comment
      @comment = Comment.find(params[:id])
    end
  end
end
