class Admin::CommentsController < ActionController::Base
  before_action :authenticate_admin!
  layout 'admin'

  expose(:topic_id){ params[:topic_id] }
  expose(:topic)   { Topic.find(topic_id) }
  expose(:comments){ topic.comments }
  expose(:comment) { Comment.find(params[:id]) }
  expose(:all)     { false }

  def index; end
  def show; end

  def all_comments
    comments = Comment.all
    render 'admin/comments/index', locals: { comments: comments, all: true }
  end
end

