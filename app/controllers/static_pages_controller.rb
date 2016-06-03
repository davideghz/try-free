class StaticPagesController < ApplicationController
  def home
    @available_lessons = Lesson.all.order(:lesson_date)
  end
end
