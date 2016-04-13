require 'rails_helper'

RSpec.feature "user can create playlist" do
  scenario "user sees playlist added to index" do
    artist = Artist.create(name: "MIA", image_path: "http://cdn.pigeonsandplanes.com/wp-content/uploads/2015/05/mia-gun.jpg")
    song = artist.songs.create(title: "Bad Girls")
    song_2 = artist.songs.create(title: "Paper Planes")

    visit playlists_path

    click_on "New playlist"
    fill_in "Name", with: "My Jams"
    check("song-#{song.id}")
    click_on "Create Playlist"

    expect(page).to have_content "My Jams"
save_and_open_page
    within("li:first") do
      expect(page).to have_link song.title, href: song_path(song)
    end
  end

end
