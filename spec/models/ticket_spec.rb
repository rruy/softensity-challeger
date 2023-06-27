require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:request_number) }
    it { should validate_presence_of(:sequence_number) }
    it { should validate_presence_of(:request_type) }
    it { should validate_presence_of(:request_action) }
  end

  describe 'associations' do
    it { should have_one(:excavator) }
    it { should have_one(:excavation_info) }
    it { should have_one(:digsite_info) }
  end
end