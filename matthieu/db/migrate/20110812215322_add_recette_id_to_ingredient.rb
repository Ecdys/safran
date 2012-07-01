class AddRecetteIdToIngredient < ActiveRecord::Migration
  def change
    add_column :ingredients, :recette_id, :integer
  end
end
