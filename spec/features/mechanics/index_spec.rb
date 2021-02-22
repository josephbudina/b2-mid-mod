require 'rails_helper'
describe 'mechanics index page' do
  before :each do
    @mechanic_1 = Mechanic.create!(name: "Jim", years_experience: 4)
    @mechanic_2 = Mechanic.create!(name: "Jane", years_experience: 5)
    @mechanic_3 = Mechanic.create!(name: "Kim", years_experience: 9)
  end

  it 'has header saying all mechanics and lists all their attributes' do
    visit '/mechanics'

    expect(page).to have_content('All Mechanics')
    expect(page).to have_content('Jane')
    expect(page).to have_content('5')
    expect(page).to have_content('Kim')
    expect(page).to have_content('9')
    expect(page).to have_content('Jim')
    expect(page).to have_content('4')
  end
end