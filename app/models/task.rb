class Task < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 250 }
  validates :priority, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :deadline, presence: true
  validates :user, presence: true

  validate :validate_deadline

  default_scope -> { order(:deadline) }

  state_machine :state, initial: :open do
    event :start do
      transition [:open] => :in_progress
    end
    event :close do
      transition [:open, :in_progress] => :done
    end
  end

  private

    def validate_deadline
      errors.add(:deadline, "can't be in the past") if deadline.present? and deadline < DateTime.now
    end
end
