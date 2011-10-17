class AddKeywordToCouleur < ActiveRecord::Migration
  def change
    add_column :couleurs, :keyword, :string
  end
end
