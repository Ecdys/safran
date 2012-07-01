class CreateRecettes < ActiveRecord::Migration
  def change
    create_table :recettes do |t|
      t.string :titre
      t.text :description
      t.string :categorie

      t.timestamps
    end
  end
end
