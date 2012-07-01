class AddAvatarToConsultant < ActiveRecord::Migration
  def up
    add_column :consultants, :avatar, :string
  end

  def down
    remove_column :consultants, :avatar
  end
end
