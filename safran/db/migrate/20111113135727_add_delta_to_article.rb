class AddDeltaToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :delta, :boolean, :default => true, :null => false
  end
end
