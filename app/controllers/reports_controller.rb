class ReportsController < ActionController::Base
  expose(:comment_id){ params[:comment] }
  expose(:slug)      { params[:slug] }

  def create
    unless current_user.has_reported?(comment_id)
      report = current_user.reports.build(comment_id: comment_id)

      if report.save
        redirect_to topic_path(slug), notice: 'The comment has been reported'
      end
    end
  end
end

