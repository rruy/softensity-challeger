class CreateExcavationInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :excavation_infos do |t|
      t.string :TypeOfWork
      t.string :WorkDoneFor
      t.string :ProjectDuration
      t.datetime :ProjectStartDate
      t.string :Explosives
      t.string :UndergroundOverhead
      t.string :HorizontalBoring
      t.string :Whitelined
      t.text :LocateInstructions
      t.text :Remarks

      t.timestamps
    end
  end
end
