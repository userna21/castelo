class Movieu < ApplicationRecord
  validates :title, uniqueness: true
  validates :title, presence: true
  has_many :vimages, dependent: :destroy
  has_many :mstreams, dependent: :destroy
end
