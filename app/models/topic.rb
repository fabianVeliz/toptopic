class Topic
  include Mongoid::Document
  include Mongoid::Slug
  include Mongoid::Timestamps

  field :title, type: String
  field :description, type: String

  slug :title

  scope :latest, -> { order(created_at: :desc) }
end
