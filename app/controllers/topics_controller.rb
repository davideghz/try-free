class TopicsController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.topics.count != 0
      @topics = current_user.topics
    else
      flash[:danger] = "You didn't create any Topic yet! Create one now!"
      redirect_to new_topic_path
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @lessons = @topic.lessons
  end

  def new
    @topic = current_user.topics.build
  end

  def create
    @topic = current_user.topics.build(topic_params)
    if @topic.save
      flash[:success] = "Topic created"
      redirect_to topics_path
    else
      flash[:danger] = "Houston, we got a problem!"
      redirect_to new_topic_path
    end
  end

  def edit
  end

  def update
    # @topic is already defined in correct_user which is called before_action
    if @topic.update_attributes(topic_params)
      flash[:success] = "Topic updated"
      redirect_to @topic
    else
      render 'edit'
    end
  end

  def destroy
    @topic.destroy
    flash[:success] = "Topic deleted"
    redirect_to topics_path
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :excerpt, :description)
  end

  def correct_user
    @topic = current_user.topics.find_by(id: params[:id])
    if @topic.nil?
      flash[:danger] = "You can't access this topic!"
      redirect_to root_url
    end
  end

end
