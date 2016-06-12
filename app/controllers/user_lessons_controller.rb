class UserLessonsController < ApplicationController
  def create
    @subscription = current_user.user_lessons.build(user_lesson_param)
    if @subscription.save
      flash[:success] = "You are now subscribed"
      redirect_to root_path
    else
      flash[:danger] = "Houston, we got a problem!"
      redirect_to root_path
    end
  end

  def destroy
  end

  private

  def user_lesson_params
    params.require(:lesson).permit(:user_id, :lesson_id)
  end

end
