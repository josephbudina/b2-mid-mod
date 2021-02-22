require 'rails_helper'
describe 'mechanics show page' do
  before :each do
    @mechanic_1 = Mechanic.create!(name: "Jim", years_experience: 4)
    @mechanic_2 = Mechanic.create!(name: "Jane", years_experience: 5)
    @mechanic_3 = Mechanic.create!(name: "Kim", years_experience: 9)
    @tea_cups = @mechanic_1.rides.create!(name: "Tea Cups", open: true, thrill_rating: 3)
    @roller_coaster = @mechanic_1.rides.create!(name: "Fast Boi", open: false, thrill_rating: 5)
    @spinner = @mechanic_1.rides.create!(name: "Spinner", open: true, thrill_rating: 7)
  end

  it 'shows name, attributes, and all associated rides' do
    visit "/mechanics/#{@mechanic_1.id}"

    expect(page).to have_content("Jim")
    expect(page).to have_content("4")
    expect(page).to have_content("Spinner")
    expect(page).to have_content("Tea Cups")
    expect("Spinner").to appear_before("Tea Cups")
    expect(page).to_not have_content("Spinner")
  end
end