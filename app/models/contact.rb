class Contact < ApplicationRecord
  belongs_to :excavator, optional: true

  validates :name, :phone, :email, presence: true
end
