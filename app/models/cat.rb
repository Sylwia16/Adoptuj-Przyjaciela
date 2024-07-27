class Cat < ApplicationRecord
  has_one_attached :image
  has_many :adoptions, dependent: :destroy
  has_many :adopters, through: :adoptions, source: :user
end
