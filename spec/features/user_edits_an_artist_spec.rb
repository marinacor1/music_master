require 'rails_helper'

RSpec.feature "user can edit an artist" do
  scenario "user sees updated artist" do
    artist_1 = "Bob Marley"
    url = "https://s-media-cache-ak0.pinimg.com/736x/b0/d7/a3/b0d7a3554f5dc903e45b6bedbb0a4010.jpg"
    artist_2 = "Selena"

    artist = Artist.create(name: artist_1, image_path: url)

    visit artist_path(artist)
    click_on "Edit"
    fill_in "artist_name", with: artist_2
    click_on "Update Artist"

    expect(page).to have_content artist_2
    expect(page).to have_css("img[src=\"#{url}\"]")
  end

end
