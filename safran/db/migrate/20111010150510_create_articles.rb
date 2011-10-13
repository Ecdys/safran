class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :distributeur
      t.string :societe
      t.string :fabricant
      t.string :description
      t.string :code_article
      t.float :prix_unitaire
      t.integer :quantite_max
      t.string :devise
      t.date :date_effective
      t.date :date_expiration
      t.integer :moq
      t.integer :multiple
      t.integer :delai_livraison
      t.string :unite_livraison
      t.string :description_etendue
      t.string :code_fournisseur_societe
      t.string :code_article_societe
      t.string :unite_achat
      t.string :famille
      t.string :code_commodite
      t.string :image
      t.decimal :taxe

      t.timestamps
    end
  end
end
