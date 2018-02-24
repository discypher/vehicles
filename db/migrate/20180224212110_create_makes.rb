class CreateMakes < ActiveRecord::Migration[5.1]
  def change
    create_table :makes do |t|
      t.string :manufacturer

      t.timestamps
    end
  end
end
