class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :date_time
      t.string :link
      t.string :venue
      t.string :other_artists

      t.timestamps
    end
  end
end
