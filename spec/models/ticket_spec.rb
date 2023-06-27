require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:RequestNumber) }
    it { should validate_presence_of(:SequenceNumber) }
    it { should validate_presence_of(:RequestType) }
    it { should validate_presence_of(:RequestAction) }
    it { should validate_presence_of(:ResponseDueDateTime) }
  end

  describe 'associations' do
    it { should belong_to(:service_area) }
    it { should have_one(:excavator) }
    it { should have_one(:excavation_info) }
    it { should have_one(:digsite_info) }
  end
end