class User < ActiveRecord::Base
  validates_presence_of :username, :email
  has_secure_password
  has_many :drills
  has_many :categories, through: :drills


end