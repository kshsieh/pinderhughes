class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :link
      t.string :name
    end
  end
end
