
class WorkCard
  include Mongoid::Document
  field :start_at, type: Time
  field :end_at, type: Time
  field :pause, type: Time, default: Time.at(0)
  validates :start_at, presence: true, :if => :should_start_at_be_nonempty? #:ended?#, :if => :paused?
  validate :start_before_end?, :pause_not_longer_then_period?

  def start_before_end?
    errors.add(:end_at, "can't be before the start") if ended? && started? && start_at>=end_at
  end

  def pause_not_longer_then_period?
  	errors.add(:pause, "can't be longer then the period betwen start and end") if ended? && started? && end_at<=(start_at+pause.to_i)
  end

  def should_start_at_be_nonempty?
  	ended? || paused?
  end

  def ended?
  	!end_at.blank?
  end

  def started?
  	!start_at.blank?
  end

  def paused?
  	return false if pause.blank?
  	pause>Time.at(0)
  end

  def total_time
  	end_at-start_at
  end
end
