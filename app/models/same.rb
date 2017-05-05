class Same < ApplicationRecord

  extend FriendlyId

  friendly_id :title, use: [:slugged, :history, :finders]

  def should_generate_new_friendly_id?
    title_changed?
  end

  validates :title, uniqueness: true
  validates :title, presence: true
  has_many :limages, dependent: :destroy

  # searchable do
  #   text :title
  # end
end
