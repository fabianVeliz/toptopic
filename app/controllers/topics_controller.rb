class TopicsController < ApplicationController
  expose(:topics)   { Topic.all.latest }
  expose(:topic)    { Topic.find(params[:slug]) }
  expose(:comments) { topic.comments }
  expose(:comment)  { Comment.new }

  def index; end
  def show; end
end
