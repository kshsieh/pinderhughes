class Blog < ActiveRecord::Base

  validates :title, presence: true
  validates :entry, presence: true
  validates :user_id, presence: true

  belongs_to :user

  default_scope order("created_at DESC")
end