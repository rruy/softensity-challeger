class AddTicketToExcavators < ActiveRecord::Migration[7.0]
  def change
    add_reference :excavators, :ticket, null: false, foreign_key: true
  end
end
