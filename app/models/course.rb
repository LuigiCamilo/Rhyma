class Course < ApplicationRecord
  belongs_to :user
  belongs_to :theme
  has_many :lectures, dependent: :destroy
  has_many :advances, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached :photo
  has_rich_text :description

  include PgSearch::Model
  pg_search_scope :search,
  against: %i[ title description ],
    associated_against: {
    theme: [ :title ]
  },
  using: {
    tsearch: { prefix: true }
  }
end
