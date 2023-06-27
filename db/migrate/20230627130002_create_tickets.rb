class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :RequestNumber
      t.string :SequenceNumber
      t.string :RequestType
      t.string :RequestAction
      t.datetime :ResponseDueDateTime

      t.timestamps
    end
  end
end
