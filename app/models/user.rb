class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :topics
  has_many :lessons, through: :topics
  has_many :user_lessons, dependent: :destroy
  has_many :subscribed_lessons, through: :user_lessons, source: :lesson

  # Subscribe to a lesson.
  def subscribe(lesson)
    user_lessons.create(lesson_id: lesson.id)
  end

  # Unfollows a user.
  def unsubscribe(lesson)
    user_lessons.find_by(lesson_id: lesson.id).destroy
  end

  # Returns true if the current user is subscribed to the lesson.
  def subscribed?(lesson)
    subscribed_lessons.include?(lesson)
  end

end
