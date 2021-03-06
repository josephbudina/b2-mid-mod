class Ride < ApplicationRecord
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics
  has_many :park_rides
  has_many :parks, through: :park_rides

  def self.list_by_thrills
    order(thrill_rating: :desc)
  end

  def self.find_open_rides
    where(open: true)
  end
end