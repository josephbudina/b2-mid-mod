require 'rails_helper'
describe 'parks index page' do
  before :each do
    @park1 = Park.create!(name: "1", price_of_admission: 4.50)
    @park2 = Park.create!(name: "2", price_of_admission: 5.30)
    @park3 = Park.create!(name: "3", price_of_admission: 9.50)
    @tea_cups = @park1.rides.create!(name: "Tea Cups", open: true, thrill_rating: 3)
    @roller_coaster = @park1.rides.create!(name: "Fast Boi", open: false, thrill_rating: 5)
    @spinner = @park1.rides.create!(name: "Spinner", open: true, thrill_rating: 7)
  end

  it 'shows name and price of park' do
    visit "/parks/#{@park1.id}"
    expect(page).to have_content("1")
    expect(page).to have_content("$4.50")
  end
end