class Lesson < ActiveRecord::Base
  belongs_to :topic, inverse_of: :lessons
  belongs_to :user

end
