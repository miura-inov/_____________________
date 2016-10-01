class CreateMachineResults < ActiveRecord::Migration
  def change
    create_table :machine_results do |t|
      t.integer :machine_id
      t.integer :hole_id
      t.integer :machine_no
      t.integer :played_games
      t.integer :counter_a
      t.integer :counter_b
      t.integer :counter_c
      t.integer :settei
      t.integer :samai
      t.date :day


      t.timestamps null: false
    end
  end
end
