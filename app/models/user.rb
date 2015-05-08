class User
  include Mongoid::Document

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Devise
  field :email,                  type: String, default: ""
  field :encrypted_password,     type: String, default: ""
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time
  field :remember_created_at,    type: Time
  field :sign_in_count,          type: Integer, default: 0
  field :current_sign_in_at,     type: Time
  field :last_sign_in_at,        type: Time
  field :current_sign_in_ip,     type: String
  field :last_sign_in_ip,        type: String

  field :favorite_topics_ids,    type: Array, default: []

  has_many :comments
  has_many :reports

  def is_already_favorite?(topic_id)
    favorite_topics_ids.include?(topic_id)
  end

  def get_favorite_topics
    Topic.find(favorite_topics_ids)
  end

  def has_reported?(comment_id)
    reports.where(comment_id: comment_id).first != nil
  end
end
