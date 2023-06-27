class AddContactToExcavator < ActiveRecord::Migration[7.0]
  def change
    add_reference :excavators, :contact, null: true, foreign_key: true
  end
end
