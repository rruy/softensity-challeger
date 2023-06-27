class Ticket < ApplicationRecord
  has_one :excavator, foreign_key: 'ticket_id'
  has_one :excavation_info, foreign_key: 'ticket_id'
  has_one :digsite_info, foreign_key: 'ticket_id'
  has_one :ticket_date_time, foreign_key: 'ticket_id'

  belongs_to :service_area, foreign_key: 'service_area_id', optional: true

  validates :request_number, :sequence_number, :request_type, :request_action, presence: true

  def build_service_area(sa_code)
    service = ServiceArea.create(ticket_id: self.id)
    PrimaryServiceAreaCode.create(sa_code: sa_code, service_area_id: service.id)
  end

  def build_excavator(excavator_attrs)
    excavator = Excavator.new(excavator_attrs)
    excavator.ticket_id = self.id
    excavator.save
  end

  def build_date_times(date_times_attrs)
    binding.pry
    ticket_date_time = TicketDateTime.new(date_times_attrs)
    ticket_date_time.ticket_id = self.id
    binding.pry
    ticket_date_time.save
  end
end
