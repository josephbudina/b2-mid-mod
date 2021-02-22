require 'rails_helper'
RSpec.describe ParkRide, type: :model do
  describe 'relationships' do
    it { should belong_to :ride}
    it { should belong_to :park}
  end
end