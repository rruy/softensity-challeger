# spec/models/ticket_date_time_spec.rb
require 'rails_helper'

RSpec.describe TicketDateTime, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:request_taken_date_time) }
    it { should validate_presence_of(:legal_date_time) }
    it { should validate_presence_of(:response_due_date_time) }
    it { should validate_presence_of(:expiration_date) }
  end

  describe 'associations' do
    it { should belong_to(:ticket) }
  end
end