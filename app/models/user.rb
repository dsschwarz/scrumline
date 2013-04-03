class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :name, :password, :password_confirmation, :remember_token
  has_many :projects
  has_and_belongs_to_many :tasks
  has_and_belongs_to_many :languages
  has_and_belongs_to_many :groups
  has_many :trequests
  has_many :grequests
  has_many :prequests
  # All requests have different models - they can be customized later.
  # Group requests should probably come with a user written application/explanation
  # Project requests could contain time available, languages, etc.

  before_save :create_remember_token

  validates :remember_token, uniqueness: true
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
