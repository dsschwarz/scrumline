class Project < ActiveRecord::Base
  attr_accessible :description, :name, :group_id, :user_id
  belongs_to :user
  has_and_belongs_to_many :users
  has_many :tasks
  has_and_belongs_to_many :languages
  belongs_to :group
  has_many :prequests

  validate :user_has_group;
  validates :description, presence: true;
  validates :name, presence:true;

  def user_has_group
    puts user_id
    puts User.find(user_id)
    if User.find(user_id).groups.find(group_id).nil?
      errors.add(:group_id, "must belong to you")
    end
  end
end
