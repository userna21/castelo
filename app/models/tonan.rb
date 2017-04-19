class Tonan < ApplicationRecord
  validates :title, :small, uniqueness: true
  validates :title, presence: true
  has_many :timages, dependent: :destroy

  # searchable do
  #   text :title
  # end
end
