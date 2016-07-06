class ProfilesController < ApplicationController
	before_action :set_profile, only: [:show, :edit, :update]

	def show
		#
	end

	def edit

	end

	def update
		respond_to do |format|
			if @profile.update(profile_params)
				format.html { redirect_to @profile, flash: "Succesfully updated your profile"}
				format.json { render :show, status: :created, location: @profile}
			else
				format.html { render :new }
				format.json { render json: @profile.errors, status: :unprocessable_entity }
			end
		end
	end

	private

	def set_profile
		@profile = Profile.find(params[:id])
	end

	def profile_params
		params.require(:profile).permit(:first_name, :last_name, :age, :bio, :location)
	end
end
