class Same < ApplicationRecord
  validates :title, uniqueness: true
  validates :title, presence: true
  has_many :limages, dependent: :destroy

  searchable do
    text :title
  end
end
