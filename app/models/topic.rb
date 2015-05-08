class Topic
  include Mongoid::Document
  include Mongoid::Slug
  include Mongoid::Timestamps

  field :title, type: String
  field :description, type: String

  slug :title

  has_many :comments, dependent: :destroy
  validates :title, :description, presence: true

  before_destroy :remove_topic_id_from_users

  scope :latest, -> { order(created_at: :desc) }

  def remove_topic_id_from_users
    User.all.each{ |u| u.save if u.favorite_topics_ids.delete(self.id.to_s) }
  end
end
