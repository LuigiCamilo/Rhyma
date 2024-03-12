class Lecture < ApplicationRecord
  belongs_to :course
  has_many_attached :photos
  has_one_attached :video
end
