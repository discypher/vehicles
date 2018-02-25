class CreateOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :options do |t|
      t.float :cost
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
