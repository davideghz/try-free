class Topic < ActiveRecord::Base
  has_many :lessons
  has_many :users, through: :lessons

  belongs_to :user
end
