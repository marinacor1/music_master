require 'rails_helper'

RSpec.feature "user can create a song" do
  scenario "user can see new song in individual page" do
    artist_1 = "Bob Marley"
    url = "https://s-media-cache-ak0.pinimg.com/736x/b0/d7/a3/b0d7a3554f5dc903e45b6bedbb0a4010.jpg"

    artist_bob = Artist.create(name: artist_1, image_path: url)
    artist_2 = Artist.create(name: "Bob Dylan", image_path: url)
    song_title = "One Love"

    visit artist_path(artist_bob)
    click_on "New Song"
    fill_in "Title", with: song_title
    click_on "Create Song"

    expect(page).to have_content song_title
    expect(page).to have_link artist_bob.name, href: artist_path(artist_bob)
  end
end
