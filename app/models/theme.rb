class Theme < ApplicationRecord
  has_many :courses, dependent: :destroy
end
