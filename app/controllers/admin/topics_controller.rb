class Admin::TopicsController < InheritedResources::Base
  before_action :authenticate_admin!
  layout 'admin'

  private
    def topic_params
      params.require(:topic).permit(:title, :description)
    end
end

