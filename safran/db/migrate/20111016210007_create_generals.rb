class CreateGenerals < ActiveRecord::Migration
  def change
    create_table :generals do |t|
      t.string :name

      t.timestamps
    end
  end
end
