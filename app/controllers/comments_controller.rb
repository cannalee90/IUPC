class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: :destroy

  # GET /comments
  # GET /comments.json


  # GET /comments/1
  # GET /comments/1.json

  # GET /comments/new

  # GET /comments/1/edit

  # POST /comments
  # POST /comments.json
  def create
    @comment = @post.comments.build(comment_params)
    
    respond_to do |format|
      if @comment.save
        flash[:success] = "성공적"
        format.html { redirect_to @post }
      else
        flash[:error] = "실패"
        format.html { redirect_to @post }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json


  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }

    end
  end

  private
    def set_post
      @post = Post.find(params[:post_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content)
    end
end
