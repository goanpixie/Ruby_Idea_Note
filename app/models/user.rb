class User < ActiveRecord::Base
  has_secure_password
  has_many :ideas
  has_many :likes, dependent: :destroy
  has_many :ideas_liked, through: :likes, source: :idea

  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :name, :presence =>true

  validates :alias, :presence =>true
  
  validates :email, :presence => true, :format => { :with => email_regex }, :uniqueness => { :case_sensitive => false }, :uniqueness=>true
  
  validates :password, :presence => true
end
