class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :nom
      t.integer :quantite

      t.timestamps
    end
  end
end
