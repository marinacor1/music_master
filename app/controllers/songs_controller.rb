class SongsController < ApplicationController

  def new
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @song = Song.create(params_check)
    redirect_to artist_path(@artist)
  end

  def show
    @song = Song.find(params[:id])
  end

  private

  def params_check
    params.require(:song).permit(:title)
  end
end
