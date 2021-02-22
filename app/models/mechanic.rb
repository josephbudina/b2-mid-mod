class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  def self.find_average_years_experience
    average(:years_experience)
  end
end