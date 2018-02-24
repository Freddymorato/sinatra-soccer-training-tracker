class Category < ActiveRecord::Base
  has_many :drill_categories
  has_many :drills, through: :drill_categories
  has_many :users, through: :drills
end