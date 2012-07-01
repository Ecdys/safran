class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :client_id
      t.text :description
      t.float :budget
      t.decimal :discount
      t.string :order_number
      t.integer :manager

      t.timestamps
    end
  end
end
