class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.references :excavator, null: true, foreign_key: true
      t.string :name
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
