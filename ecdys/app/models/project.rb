class Project < ActiveRecord::Base
  validates_presence_of :name, :start_date, :end_date, :amount
  validates_uniqueness_of :name
  belongs_to :client
end
