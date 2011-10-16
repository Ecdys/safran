class CreateMatieres < ActiveRecord::Migration
  def change
    create_table :matieres do |t|
      t.string :name

      t.timestamps
    end
  end
end
