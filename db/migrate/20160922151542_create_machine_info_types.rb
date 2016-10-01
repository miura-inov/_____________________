class CreateMachineInfoTypes < ActiveRecord::Migration
  def change
    create_table :machine_info_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
