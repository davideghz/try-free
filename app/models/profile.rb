class Profile < ActiveRecord::Base

	belongs_to :user

	validate :profile_picture_size

	mount_uploader :profile_picture, ProfilePictureUploader

	private

  def profile_picture_size
  	if profile_picture.size > 3.megabytes
  		errors.add(:profile_picture, "File size should be less than 3MB")
  	end
  end

end
