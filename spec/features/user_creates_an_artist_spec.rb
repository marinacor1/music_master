require 'rails_helper'

RSpec.feature "user create a new artist" do
  scenario "user will see the page for the individual artist" do
    artist_name = "Bob Marley"
    artist_image_path = "https://s-media-cache-ak0.pinimg.com/736x/b0/d7/a3/b0d7a3554f5dc903e45b6bedbb0a4010.jpg"

    visit artists_path
    click_on "New artist"
    fill_in "artist_name", with: artist_name
    fill_in "artist_image_path", with: artist_image_path
    click_on "Create Artist"

    expect(page).to have_content artist_name
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end
end
