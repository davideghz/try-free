class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :lessons, dependent: :destroy, inverse_of: :topic

  validates :title,  presence: true, length: { maximum: 18 }
  validates :picture,  presence: true

  validate  :picture_size

  mount_uploader :picture, PictureUploader

  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 1.megabytes
        errors.add(:picture, "should be less than 1MB")
      end
    end

end
