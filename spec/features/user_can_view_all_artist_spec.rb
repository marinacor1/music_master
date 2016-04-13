require 'rails_helper'

RSpec.feature "user can view all artists on one page" do
  scenario "list of all artists shows" do
    artist_1 = "Bob Marley"
    url = "https://s-media-cache-ak0.pinimg.com/736x/b0/d7/a3/b0d7a3554f5dc903e45b6bedbb0a4010.jpg"
    artist_2 = "Selena"
    url_2 = "http://media2.fdncms.com/sacurrent/imager/adoration-for-tejano-music-superstar-selen/u/original/2413220/selena-quintanilla-1.jpg"

    Artist.create(name: artist_1, image_path: url)
    Artist.create(name: artist_2, image_path: url_2)

    visit artists_path

    expect(page).to have_content artist_1
    expect(page).to have_css("img[src=\"#{url}\"]")
    expect(page).to have_content artist_2
    expect(page).to have_css("img[src=\"#{url_2}\"]")


  end
end
