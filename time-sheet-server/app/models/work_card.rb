class WorkCard
  include Mongoid::Document
  field :start_at, type: Time
  field :end_at, type: Time
  field :pause, type: Time

  def total_time
  	end_at-start_at
  end
end
