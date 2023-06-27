class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.references :excavator, null: false, foreign_key: true
      t.string :Name
      t.string :Phone
      t.string :Email

      t.timestamps
    end
  end
end
