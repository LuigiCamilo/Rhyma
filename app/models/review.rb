class Review < ApplicationRecord
  belongs_to :user
  belongs_to :course
  validates :coment, presence: true
end
