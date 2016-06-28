class ProfileController < ApplicationController

	def show
		#
	end

	def edit

	end

	private

	def profile_params
		params.require(:profile).permit(:first_name, :last_name, :age, :bio, :location)
	end
end
