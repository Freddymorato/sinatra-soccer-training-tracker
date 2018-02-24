class User < ActiveRecord::Base
  validates_presence_of :username, :email
  has_secure_password
  has_many :drills
  has_many :categories, through: :drills


  def slug
    self.username.gsub(/\s/, '-').downcase
  end

  def self.find_by_slug(slug)
    self.all.find{|a| a.slug == slug}
  end
end
