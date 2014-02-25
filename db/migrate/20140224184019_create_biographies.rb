class CreateBiographies < ActiveRecord::Migration
  def change
    create_table :biographies do |t|
      t.text :content
    end
  end
end
