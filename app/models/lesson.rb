class Lesson < ActiveRecord::Base

  scope :country, -> (country) { where country: country }

  scope :contains, ->(word) {
    joins(:topic).where('topics.title LIKE ?', "%#{word.html_safe}%")
  }

  include Filterable

  belongs_to :topic, inverse_of: :lessons
  belongs_to :user
  has_many :user_lessons
  has_many :subscribed_users, through: :user_lessons, source: :user


  validates :lesson_date,  presence: true
  validates :country,  presence: true
  validates :city,  presence: true
  validates :address,  presence: true

end
