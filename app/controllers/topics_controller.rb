class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find_by(params[:id])
  end

  def new
  end

  def create
  end
end
