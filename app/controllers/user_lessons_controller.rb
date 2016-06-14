class UserLessonsController < ApplicationController
  def create
    lesson = Lesson.find(params[:lesson_id])
    current_user.subscribe(lesson)
    flash[:success] = "You succesfully subscribed to the lesson!"
    redirect_to root_path
  end

  def destroy
    lesson = UserLesson.find(params[:id])
    current_user.unsubscribe(lesson)
    flash[:success] = "You succesfully unsubscribed from the lesson!"
    redirect_to root_path
  end

end
