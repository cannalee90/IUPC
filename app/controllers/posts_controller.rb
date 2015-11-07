class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :get_pass]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.order(:id)
    
    @cnt = 0
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  def get_pass
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        flash[:success] = "게시물이 성공적으로 업로드 되었습니다."
        format.html { render :show}
      else
        flash[:error] = "부족한 곳을 채워주세요"
        format.html { render :new}
        format.json { render json: @post.errors }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      edited = Post.new(post_params)
      if @post.authenticate(edited.password) and @post.update(post_params) #check authenticate with parameter
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    edited = Post.new(post_params)
    if @post.authenticate(edited.password)
      @post.destroy
      respond_to do |format|
        format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      end
    else
      respond_to do |format|
        format.html { redirect_to :back, error: '비밀번호가 일치하지 않습니다.' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :password, :name)
    end
end
