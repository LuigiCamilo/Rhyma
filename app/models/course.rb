class Course < ApplicationRecord
  belongs_to :user
  belongs_to :theme
  has_many :lectures, dependent: :destroy
  has_many :advances, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
