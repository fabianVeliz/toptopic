class TopicsController < ApplicationController
  expose(:topics){ Topic.all.latest }
  expose(:topic) { Topic.find(params[:slug]) }

  def index; end
  def show; end
end
