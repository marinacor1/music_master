require 'rails_helper'

RSpec.feature "user can delete artist" do
  pending  scenario "user sees index page of artist" do
    artist_1 = "Bob Marley"
    url = "https://s-media-cache-ak0.pinimg.com/736x/b0/d7/a3/b0d7a3554f5dc903e45b6bedbb0a4010.jpg"

    artist_bob = Artist.create(name: artist_1, image_path: url)

    visit artist_path(artist_bob)

    click_on "Delete"

    expect(page).to not_have_content artist_1
    expect(page).to not_have_css("img[src=\"#{url}\"]")
  end
end
