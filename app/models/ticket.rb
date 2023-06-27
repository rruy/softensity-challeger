class Ticket < ApplicationRecord
  has_one :excavator, foreign_key: 'ticket_id'
  has_one :excavation_info
  has_one :digsite_info
  belongs_to :service_area, foreign_key: 'service_area_id'

  validates :RequestNumber, :SequenceNumber, :RequestType, :RequestAction, :ResponseDueDateTime, presence: true
end
