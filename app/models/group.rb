class Group < ActiveRecord::Base
  attr_accessible :name
  has_many :projects
  has_and_belongs_to_many :users

end
