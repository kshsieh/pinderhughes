class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.text :entry
      t.string :title
      t.integer :user_id

      t.timestamps
    end
  end
end
