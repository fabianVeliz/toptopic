class FavoritesController < ApplicationController
  before_action :authenticate_user!
  expose(:slug) { params[:slug] }
  expose(:topic){ Topic.find(slug) }

  def create
    unless current_user.is_already_favorite?(topic.id)
      favorite = current_user.favorites.build(topic_id: topic.id)
      if favorite.save
        redirect_to topic_path(slug), notice: 'Your favorite topic has been saved successfully'
      end
    end
  end

  def destroy
    favorite = current_user.favorites.where(topic_id: topic.id).first
    if favorite.destroy
      redirect_to topic_path(slug), notice: 'Your favorite topic has been deleted successfully'
    end
  end
end
