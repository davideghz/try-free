class ProfilesController < ApplicationController
	before_action :set_profile, only: [:show, :edit, :update]

	def show
		#
	end

	def edit

	end

	def update
		if @profile.update(profile_params)
			flash[:success] =  "Succesfully updated your profile"
			redirect_to @profile
			else
				render :new
			end
	end

	private

	def set_profile
		@profile = Profile.find(params[:id])
	end

	def profile_params
		params.require(:profile).permit(:first_name, :last_name, :age, :bio, :location, :profile_picture)
	end
end
