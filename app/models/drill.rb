class Drill < ActiveRecord::Base
  belongs_to :user
  has_many :drill_categories
  has_many :categories, through: :drill_categories
end