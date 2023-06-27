class CreateDigsiteInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :digsite_infos do |t|
      t.string :LookupBy
      t.string :LocationType
      t.string :Subdivision
      t.text :WellKnownText

      t.timestamps
    end
  end
end
