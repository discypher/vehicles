class CreateJoinTableOptionsVehicles < ActiveRecord::Migration[5.1]
  def change
    create_join_table :options, :vehicles do |t|
    end
  end
end
