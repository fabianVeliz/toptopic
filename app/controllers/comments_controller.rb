class CommentsController < ApplicationController
  before_action :authenticate_user!
  expose(:topic){ Topic.find(params[:topic_slug]) }

  def create
    comment = current_user.comments.build(comment_params)
    comment.topic_id = topic.id

    if comment.save
      redirect_to topic_path(topic), notice: 'The comment has been created successfully'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
