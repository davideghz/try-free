class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :lessons, dependent: :destroy

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
