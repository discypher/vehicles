class AddYearToModel < ActiveRecord::Migration[5.1]
  def change
    add_column :models, :year, :integer
  end
end
