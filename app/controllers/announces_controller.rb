class AnnouncesController < ApplicationController
  def index
    @announces = Announce.all
  end

  def show
    set_announce    
  end

  private
    def set_announce
      @announce = Announce.find(params[:id])
    end

    def announce_params
      params.require(:announce).permit(:title, :content)
    end
end
