require 'rails_helper'

RSpec.feature "user create a new artist" do
  scenario "user will see the page for the individual artist" do
    artist_name = "Bob Marley"
    artist_image_path = "www.google.com"

    visit artist_path
    click_on "New artist"
    fill_in "artist_name", with: artist_name
    fill_in "artist_image_path", with: artist_image_path
    click_on "Create Artist"

    expect(page).to have_content artist_name
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end
end
