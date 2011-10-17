class AddKeywordToGeneral < ActiveRecord::Migration
  def change
    add_column :generals, :keyword, :string
  end
end
