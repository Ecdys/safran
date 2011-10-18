class AddIndexToGeneral < ActiveRecord::Migration
  def change
    add_index :generals, :name
  end
end
