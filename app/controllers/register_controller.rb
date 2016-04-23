class RegisterController < ApplicationController

  def new
    @team = Team.new
    3.times { @team.participants.build }
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      flash[:success] = "성공적으로 등록되었습니다."
      redirect_to '/register/new'
    else
      render :new
    end
  end
  #TODO 수정할 수 있게 그리고 등록된 팀들을 다 볼 수 있게 하자?

  private
    def team_params
      params.require(:team).permit(:name, participants_attributes: [:id, :name, :email, :phone, :sn, :role, :major])
    end
end
