class FavoritesController < ApplicationController
  before_action :authenticate_user!
  expose(:slug)  { params[:slug] }
  expose(:topic) { Topic.find(slug) }
  expose(:topics){ current_user.get_favorite_topics }

  def create
    unless current_user.is_already_favorite?(topic.id.to_s)
      current_user.favorite_topics_ids.push(topic.id.to_s)
      if current_user.save
        redirect_to topic_path(slug), notice: 'Your favorite topic has been saved successfully'
      end
    end
  end

  def index; end

  def destroy
    current_user.favorite_topics_ids.delete(topic.id.to_s)
    if current_user.save
      redirect_to topic_path(slug), notice: 'Your favorite topic has been deleted successfully'
    end
  end
end
