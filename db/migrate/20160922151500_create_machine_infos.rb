class CreateMachineInfos < ActiveRecord::Migration
  def change
    create_table :machine_infos do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
