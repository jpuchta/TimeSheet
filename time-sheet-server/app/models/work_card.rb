class WorkCard
  include Mongoid::Document
  field :start, type: DateTime
  field :end, type: DateTime
  field :multiplyier, type: Float
end
