class AddTicketToExcavationInfos < ActiveRecord::Migration[7.0]
  def change
    add_reference :excavation_infos, :ticket, null: true, foreign_key: true
  end
end
