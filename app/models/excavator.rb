class Excavator < ApplicationRecord
  has_one :contact
  has_one :fild_contact

  belongs_to :ticket, foreign_key: 'ticket_id'
end
