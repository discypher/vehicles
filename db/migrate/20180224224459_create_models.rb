class CreateModels < ActiveRecord::Migration[5.1]
  def change
    create_table :models do |t|
      t.references :make, foreign_key: true
      t.string :name
      t.float :base_cost

      t.timestamps
    end
  end
end
