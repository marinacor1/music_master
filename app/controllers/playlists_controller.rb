class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.all
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.create(params_check)
    redirect_to playlist_path(@playlist)
  end

  def show
    @playlist = Playlist.find(params[:id])
    @songs = @playlist.songs
  end

  private

  def params_check
    params.require(:playlist).permit(:name)
  end


end
