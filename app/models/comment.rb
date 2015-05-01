class Comment
  include Mongoid::Document

  field :body, type: String

  belongs_to :user
  belongs_to :topic
  has_many :reports
end
