class StaticPagesController < ApplicationController
  def home
    @available_lessons = Topic.joins(:lessons)
  end
end
