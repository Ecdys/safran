class Project < ActiveRecord::Base
  attr_accessible :name, :client_id, :description, :budget, :discount, :order_number, :manager
end
