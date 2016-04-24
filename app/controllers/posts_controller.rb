class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :confirm]

  def index
    @posts = Post.all.includes(:comments)
  end

  def show

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "게시물이 성공적으로 업로드 되었습니다."
      redirect_to @post
    else
      render :new
    end
  end

  def edit
    if @post.authenticate(pw_params)
      render :edit
    else
      redirect_to :back, alert: "잘못된 패스워드를 입력했습니다."
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    if @post.authenticate(pw_params)
      @post.destroy
      redirect_to posts_path
    else
      redirect_to :back, alert: "잘못된 패스워드를 입력했습니다."
    end
  end

  private

  def pw_params
    params[:password]
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :password, :name)
  end
end
