class Lecture < ApplicationRecord
  belongs_to :course

  has_many_attached :photos
  has_one_attached :video

  has_rich_text :content
end
