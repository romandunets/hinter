class Task < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 250 }
  validates :priority, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :deadline, presence: true
  validates :user, presence: true

  validate :validate_deadline

  default_scope -> { order(closed_at: :asc, priority: :desc, deadline: :asc) }

  state_machine :state, initial: :open do
    after_transition :on => :close, :do => :closed

    event :start do
      transition [:open] => :in_progress
    end

    event :close do
      transition [:open, :in_progress] => :done
    end

    event :undo do
      transition [:done] => :open
    end
  end

  def toggle_state
    open? ? close : undo
  end

  private

    def validate_deadline
      errors.add(:deadline, "can't be in the past") if deadline.present? and deadline < DateTime.now
    end

    def closed
      update_attribute(:closed_at, DateTime.now)
    end
end
