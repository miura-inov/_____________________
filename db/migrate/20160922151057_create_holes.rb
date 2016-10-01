class CreateHoles < ActiveRecord::Migration
  def change
    create_table :holes do |t|
      t.string :name
      t.integer :area_id
      t.string :url
      
      t.timestamps null: false
    end
  end
end
