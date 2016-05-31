class LessonsController < ApplicationController

  before_action :authenticate_user!
  # before_action :correct_user, only: [:show, :edit, :update, :destroy]

  def show
    @lesson = Lesson.find(params[:id])
  end

  def new
    @topic = current_user.topics.find(params[:topic_id])
    @lesson = current_user.lessons.build
  end

  def create
    @topic = current_user.topics.find(params[:topic_id])
    @lesson = @topic.lessons.build(lesson_params)
    if @lesson.save
      flash[:success] = "Lesson created"
      redirect_to topics_path
    else
      flash[:danger] = "Houston, we got a problem!"
      redirect_to new_lesson_path
    end
  end

  def edit
  end

  def update
    # @lesson is already defined in correct_user which is called before_action
    if @lesson.update_attributes(topic_params)
      flash[:success] = "Lesson updated"
      redirect_to @topic
    else
      render 'edit'
    end
  end

  def destroy
    @lesson.destroy
    flash[:success] = "Lesson deleted"
    redirect_to topics_path
  end

  private

  def lesson_params
    params.require(:lesson).permit(:lesson_date, :country, :city, :address)
  end

  def correct_user
    @lesson = current_user.lessons.find_by(id: params[:id])
    if lesson.nil?
      flash[:danger] = "You can't access this topic!"
      redirect_to root_url
    end
  end

end
