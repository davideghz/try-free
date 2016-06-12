class UserLessonsController < ApplicationController
  def create
    lesson = Lesson.find(params[:lesson_id])
    current_user.subscribe(lesson)
    redirect_to root_path
  end

  def destroy
  end

  private

  def user_lesson_params
    params.require(:user_lesson).permit(:user_id, :lesson_id)
  end

end
