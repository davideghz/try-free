class Lesson < ActiveRecord::Base
  belongs_to :topic, inverse_of: :lessons
  belongs_to :user

  validates :lesson_date,  presence: true
  validates :country,  presence: true
  validates :city,  presence: true
  validates :address,  presence: true

end
