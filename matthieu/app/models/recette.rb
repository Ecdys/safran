class Recette < ActiveRecord::Base
  has_many :ingredients
end
