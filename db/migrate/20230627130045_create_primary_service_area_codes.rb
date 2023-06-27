class CreatePrimaryServiceAreaCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :primary_service_area_codes do |t|
      t.references :service_area, null: true, foreign_key: true
      t.string :sa_code

      t.timestamps
    end
  end
end
