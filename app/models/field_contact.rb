class FieldContact < ApplicationRecord
  belongs_to :excavator

  validates :name, :phone, :email, presence: true
end
