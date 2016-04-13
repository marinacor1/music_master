class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def create
    @artist = Artist.create(param_check)
    redirect_to artist_path(@artist)
  end

  private
  def param_check
    params.require(:artist).permit(:name, :image_path)
  end
end
