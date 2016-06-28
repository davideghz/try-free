class ProfileController < ApplicationController
	before_action :set_profile, only: [:show, :edit]

	def show
		#
	end

	def edit

	end

	private

	def set_profile
		@profile = Profile.find(params[:id])
	end

	def profile_params
		params.require(:profile).permit(:first_name, :last_name, :age, :bio, :location)
	end
end
