class AddServiceAreaToTickets < ActiveRecord::Migration[7.0]
  def change
    add_reference :tickets, :service_area, null: true, foreign_key: true
  end
end
