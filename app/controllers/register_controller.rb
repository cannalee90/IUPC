class RegisterController < ApplicationController
  #before_action :set_post, only: [:create]
  def new
    @team = Team.new
    3.times {@team.participants.build}    
  end

  def create
    @team = Team.new(team_params)
    respond_to do |format|
      if @team.save
        format.html { redirect_to root_path }
      else
        format.html { redirect_to :back}
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
