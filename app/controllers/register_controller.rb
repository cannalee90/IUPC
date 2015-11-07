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
        format.html { redirect_to root_path }
      else
        flash[:error] = "부족한 곳을 채워주세요"
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
