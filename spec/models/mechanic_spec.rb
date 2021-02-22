require 'rails_helper'
RSpec.describe Mechanic, type: :model do
  before :each do
    @mechanic_1 = Mechanic.create!(name: "Jim", years_experience: 4)
    @mechanic_2 = Mechanic.create!(name: "Jane", years_experience: 5)
    @mechanic_3 = Mechanic.create!(name: "Kim", years_experience: 9)
  end

  describe 'relationships' do
    it { should have_many :ride_mechanics}
    it { should have_many(:rides).through(:ride_mechanics)}
  end

  describe 'Class Methods' do
    it '::find_average_years_experience' do
      expect(Mechanic.find_average_years_experience).to eq(6)
    end
  end
end