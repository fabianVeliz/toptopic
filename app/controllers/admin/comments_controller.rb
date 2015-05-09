class Admin::CommentsController < InheritedResources::Base
  before_action :authenticate_admin!
  layout 'admin'
  actions :index, :show, :destroy

  expose(:title){ title }

  private

  def user_id_param
    params[:user_id]
  end

  def topic_slug_param
    params[:topic_slug]
  end

  def title
    if user_id_param
      User.find(user_id_param).email + '\'s comments'
    elsif topic_slug_param
      'Comments of topic'
    else
      'Listing comments'
    end
  end

  def collection
    if topic_slug_param
      Topic.find(topic_slug_param).comments
    elsif user_id_param
      User.find(user_id_param).comments
    else
      Comment.all
    end
  end
end


