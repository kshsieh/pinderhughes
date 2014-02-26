class DropBiographiesTable < ActiveRecord::Migration
  def up
    drop_table :biographies
  end

  def down
    create_table :biographies do |t|
      t.text :content
    end
  end
end
