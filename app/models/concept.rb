class Concept < ActiveRecord::Base
  has_many :keypoints, dependent: :destroy

  accepts_nested_attributes_for :keypoints
end
