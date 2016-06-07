class LessonDetailsController < ApplicationController
  def show
    @lesson_detail = Lesson.find(params[:id])
    respond_to do |format|
      format.html {}
      format.js
    end
  end
end
