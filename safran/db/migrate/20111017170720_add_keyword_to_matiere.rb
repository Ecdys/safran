class AddKeywordToMatiere < ActiveRecord::Migration
  def change
    add_column :matieres, :keyword, :string
  end
end
