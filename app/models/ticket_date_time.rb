class TicketDateTime < ApplicationRecord
  belongs_to :ticket

  validates :request_taken_date_time, :legal_date_time, :response_due_date_time, :expiration_date, presence: true

  # Attribute definitions
  attribute :request_taken_date_time, :datetime
  attribute :transmission_date_time, :datetime
  attribute :legal_date_time, :datetime
  attribute :response_due_date_time, :datetime
  attribute :restake_date, :datetime
  attribute :expiration_date, :datetime
  attribute :lp_meeting_accept_due_date, :datetime
  attribute :overhead_begin_date, :datetime
  attribute :overhead_end_date, :datetime
end
