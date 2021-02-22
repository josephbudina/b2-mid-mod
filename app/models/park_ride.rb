class ParkRide < ApplicationRecord
  belongs_to :ride
  belongs_to :park
end