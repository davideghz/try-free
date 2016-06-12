class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :topics
  has_many :lessons, through: :topics
  has_many :user_lessons, dependent: destroy
  has_many :subscribed_lessons, through: :user_lessons, source: :lesson


end
