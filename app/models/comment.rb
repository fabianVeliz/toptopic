class Comment
  include Mongoid::Document

  field :body, type: String

  belongs_to :user
  belongs_to :topic
  has_many :reports

  validates :body, presence: true

  def reports_count
    reports.count
  end
end
