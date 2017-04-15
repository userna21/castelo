class Same < ApplicationRecord
  validates :title, uniqueness: true
  validates :title, presence: true
  has_many :limages, dependent: :destroy
end
