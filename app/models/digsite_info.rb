class DigsiteInfo < ApplicationRecord
  belongs_to :ticket, foreign_key: 'ticket_id'
end
