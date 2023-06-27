class AddTicketToDigsiteInfos < ActiveRecord::Migration[7.0]
  def change
    add_reference :digsite_infos, :ticket, null: false, foreign_key: true
  end
end
