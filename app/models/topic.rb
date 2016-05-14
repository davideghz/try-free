class Topic < ActiveRecord::Base
  has_many :lessons
  belongs_to :user
end
