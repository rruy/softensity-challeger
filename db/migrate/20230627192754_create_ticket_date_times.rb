class CreateTicketDateTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :ticket_date_times do |t|
      t.datetime :request_taken_date_time
      t.datetime :transmission_date_time
      t.datetime :legal_date_time
      t.datetime :response_due_date_time
      t.datetime :restake_date
      t.datetime :expiration_date
      t.datetime :lp_meeting_accept_due_date
      t.datetime :overhead_begin_date
      t.datetime :overhead_end_date
      t.references :ticket, foreign_key: true

      t.timestamps
    end
  end
end
