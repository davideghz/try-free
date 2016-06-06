class StaticPagesController < ApplicationController
  def home
    # @available_lessons = Lesson.all.order(:lesson_date)
    @available_lessons = Lesson.filter(params.slice(:country, :contains)).order(:lesson_date)
  end
end
