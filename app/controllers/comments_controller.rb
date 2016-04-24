class CommentsController < ApplicationController
  before_action :set_post, only: [:create]
  before_action :set_comment, only: :destroy

  def create
    @comment = @post.comments.build(comment_params)
    if @comment.save
      flash[:success] = "성공적"
      redirect_to @post
    else
      flash[:error] = "실패"
      redirect_to @post
    end
  end

  def destroy
    @comment.destroy
    redirect_to :back
  end

  private
    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
end
