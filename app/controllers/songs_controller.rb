class SongsController < ApplicationController

  def new
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new(params_check)
    # @song = Song.create(title: params[:song][:title], artist_id: @artist.id)
    if @song.save
      redirect_to artist_song_path(@artist, @song)
    else
      render :new
    end
  end

  def show
    @song = Song.find(params[:id])
  end

  private

  def params_check
    params.require(:song).permit(:title)
  end
end
