class Task < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 250 }

  default_scope -> { order(created_at: :desc) }
end
