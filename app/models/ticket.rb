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
    binding.pry
    contact = Contact.create(excavator_attrs[:contact])
    field_contact = FieldContact.create(excavator_attrs[:field_contact])

    Excavator.create(
      company_name: excavator_attrs[:company_name],
      address: excavator_attrs[:address],
      city: excavator_attrs[:city],
      zip: excavator_attrs[:zip],
      type: excavator_attrs[:type],
      crew_onsite: excavator_attrs[:crew_onsite],
      contact_id: contact.id,
      field_contact_id: field_contact.id,
      ticket_id: self.id
    )
  end

  def build_date_times(date_times_attrs)
    ticket_date_time = TicketDateTime.new(date_times_attrs)
    ticket_date_time.ticket_id = self.id
    ticket_date_time.save
  end
end
