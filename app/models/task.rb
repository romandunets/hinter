class Task < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 250 }

  default_scope -> { order(:deadline) }

  state_machine :state, initial: :open do
    event :start do
      transition [:open] => :in_progress
    end
    event :close do
      transition [:open, :in_progress] => :done
    end
  end
end
