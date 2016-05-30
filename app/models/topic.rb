class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :lessons, dependent: :destroy

end
