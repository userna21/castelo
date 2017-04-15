class Oploverz < ApplicationRecord
  validates :title, :sinops, :small, :medium, uniqueness: true
  validates :title, presence: true
  has_many :oimages, dependent: :destroy
end
