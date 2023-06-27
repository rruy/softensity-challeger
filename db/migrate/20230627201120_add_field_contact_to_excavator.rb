class AddFieldContactToExcavator < ActiveRecord::Migration[7.0]
  def change
    add_reference :excavators, :field_contact, null: true, foreign_key: true
  end
end
