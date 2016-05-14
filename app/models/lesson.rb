class Lesson < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user, through: :topic
end
