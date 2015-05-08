class Admin::TopicsController < InheritedResources::Base
  before_action :authenticate_admin!

  expose(:user)                { User.find(params[:id]) }
  expose(:favorite_topics_list){ user.get_favorite_topics }

  layout 'admin'

  def favorite_topics
    render 'admin/topics/index', locals: { collection: favorite_topics_list, title: user.email + '\'s favorite topics' }
  end

  private
    def topic_params
      params.require(:topic).permit(:title, :description)
    end
end

