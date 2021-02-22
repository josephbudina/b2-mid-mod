require 'rails_helper'
RSpec.describe Ride, type: :model do
  describe 'relationships' do
    it { should have_many :ride_mechanics}
    it { should have_many(:mechanics).through(:ride_mechanics)}
    it { should have_many :park_rides}
    it { should have_many(:parks).through(:park_rides)}
  end

  describe "Class Methods" do
    it '::lists_by_thrill_level' do
      @mechanic_1 = Mechanic.create!(name: "Jim", years_experience: 4)
      @tea_cups = @mechanic_1.rides.create!(name: "Tea Cups", open: true, thrill_rating: 3)
      @roller_coaster = @mechanic_1.rides.create!(name: "Fast Boi", open: false, thrill_rating: 5)
      @spinner = @mechanic_1.rides.create!(name: "Spinner", open: true, thrill_rating: 7)

      expect(@mechanic_1.rides.list_by_thrills).to eq([@spinner, @roller_coaster, @tea_cups])
    end

    it '::finds_open_rides' do
      @mechanic_1 = Mechanic.create!(name: "Jim", years_experience: 4)
      @tea_cups = @mechanic_1.rides.create!(name: "Tea Cups", open: true, thrill_rating: 3)
      @roller_coaster = @mechanic_1.rides.create!(name: "Fast Boi", open: false, thrill_rating: 5)
      @spinner = @mechanic_1.rides.create!(name: "Spinner", open: true, thrill_rating: 7)

      expect(@mechanic_1.rides.find_open_rides).to eq([@tea_cups, @spinner])
    end
  end
end