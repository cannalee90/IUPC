class RegisterController < ApplicationController
  #before_action :set_post, only: [:create]
  def new
    @team = Team.new
    @tmp = 0
    3.times {@team.participants.build}    
  end

  def create
    @team = Team.new(team_params)
    respond_to do |format|
      if @team.save
        flash[:success] = "성공적으로 등록되었습니다."
        format.html { redirect_to '/register/new' }
      else
        flash[:error] = "잘못된 곳을 확인해주세요"
        format.html { render :new }
        format.json { render json: @team.errors }
      end
    end
  end
  def search
  end

  def result
  end

  private
    def team_params
      params.require(:team).permit(:name, participants_attributes: [:id, :name, :email, :phone, :sn, :role])
    end
end
