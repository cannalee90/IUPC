class Teamlist::MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /posts
  # GET /posts.json
  def index
    @message = Message.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    
  end

  # GET /posts/new
  def new
    @message = Message.new
  end

  # GET /posts/1/edit
  def edit
  end


  # POST /posts
  # POST /posts.json
  def create
    @message = Message.new(post_params)
    respond_to do |format|
      if @message.save
        flash[:success] = "문자가 성공적으로 업로드 되었습니다."
        format.html { render :show}
      else
        flash[:error] = "부족한 곳을 채워주세요"
        format.html { render :new}
        format.json { render json: @message.errors }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      
      if @message.update(post_params) #check authenticate with parameter
        format.html { redirect_to @message }
      else
        format.html { redirect_to @message }
      end
    end
  end
  
  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy    
    if @message.destroy
      respond_to do |format|
        format.html { redirect_to messages_path, notice: 'Post was successfully destroyed.' }
      end
    else
      respond_to do |format|
        format.html { redirect_to messages_path, error: '비밀번호가 일치하지 않습니다.' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:message).permit(:title, :content)
    end
end
