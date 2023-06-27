class CreateExcavators < ActiveRecord::Migration[7.0]
  def change
    create_table :excavators do |t|
      t.string :CompanyName
      t.string :Address
      t.string :City
      t.string :State
      t.string :Zip
      t.boolean :CrewOnsite

      t.timestamps
    end
  end
end
