require 'rails_helper'
RSpec.describe Park, type: :model do
  describe 'relationships' do
    it { should have_many :park_rides}
    it { should have_many(:rides).through(:park_rides)}
  end
end