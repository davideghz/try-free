class TopicsController < ApplicationController

  before_action :authenticate_user!

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
  end

  def new
    @topic = current_user.topics.build
  end

  def edit
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

  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }
        format.json { render :show, status: :ok, location: @topic }
      else
        format.html { render :edit }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to topics_url, notice: 'Topic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:name, :country, :city, :address)
  end
end
