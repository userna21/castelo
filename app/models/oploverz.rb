class Oploverz < ApplicationRecord
  validates :title, uniqueness: true
  has_many :oimages, dependent: :destroy
end
