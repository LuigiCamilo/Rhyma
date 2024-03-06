class Course < ApplicationRecord
  belongs_to :user
  belongs_to :theme
  has_many :lectures
  has_many :advances
  has_many :reviews
end
