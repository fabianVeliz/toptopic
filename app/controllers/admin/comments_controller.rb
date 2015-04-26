class Admin::CommentsController < ActionController::Base
  before_action :authenticate_admin!

  expose(:topic_id){ params[:topic_id] }
  expose(:topic)   { Topic.find(topic_id) }
  expose(:comments){ topic.comments }
  expose(:comment) { Comment.find(params[:id]) }

  def index; end
  def show; end
end

