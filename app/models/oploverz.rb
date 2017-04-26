class Oploverz < ApplicationRecord
  validates :title, uniqueness: true
  validates :title, presence: true
  has_many :oimages, dependent: :destroy
  has_many :ostreams, dependent: :destroy

  # searchable do
  #   text :title
  # end
end
