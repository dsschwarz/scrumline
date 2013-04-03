class Task < ActiveRecord::Base
  attr_accessible :description, :parent_id, :project_id
  belongs_to :project
  # Parent id is id of parent TASK
  has_and_belongs_to_many :users
  has_and_belongs_to_many :languages
  has_many :trequests
end
