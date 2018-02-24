class DrillCategory < ActiveRecord::Base
  belongs_to :drill
  belongs_to :category
end
