
class WorkCard
  include Mongoid::Document
  field :start_at, type: Time
  field :end_at, type: Time
  field :pause, type: Time, default: Time.at(0)
  validates :start_at, presence: true, :if => :should_start_at_be_nonempty? #:ended?#, :if => :paused?
  validate :start_before_end?, :pause_not_longer_then_period?

#  attr_accesor: bu

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
  	end_at-start_at - pause.to_i
  end

  def start!
    errors.add(:start!,"cannot start a WorkCard that was alredy started") if started?
    write_attribute(:start_at,Time.now()) unless started?
  end

  def end!
    errors.add(:end!,"cannot end a WorkCard that was not started") unless started?
    errors.add(:end!,"cannot end a WorkCard that was already ended") if ended?
    set_end_at(Time.now()) if started? && !ended?
  end

  def set_start_at(x)
    write_attribute(:start_at,x)
  end

  def set_end_at(x)
    write_attribute(:end_at,x)
  end
  def set_pause(x)
    write_attribute(:pause,x)
  end
end
