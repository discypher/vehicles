class CreateJoinTableModelsOptions < ActiveRecord::Migration[5.1]
  def change
    create_join_table :models, :options do |t|
      t.index [:model_id, :option_id]
      t.index [:option_id, :model_id]
    end
  end
end
