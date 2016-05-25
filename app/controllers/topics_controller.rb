class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find_by(params[:id])
  end

  def new
  end

  def create
    @topic = Topics.new(topics_params)

    respnd_to do |format|
      if @topic.save
        format.html {redirect_to @topic, flash: "Topic was successfully created"}
        format.json { render :show, status: :created, location: @topic}
      else
        format.html {render :new}
        format.json {render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def topics_params
    params.require(:topic).permit()
  end
end
