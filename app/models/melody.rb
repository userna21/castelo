class Melody < ApplicationRecord

  extend FriendlyId

  friendly_id :mtitle, use: [:slugged, :history, :finders]

  def should_generate_new_friendly_id?
    mtitle_changed?
  end


  validates :mtitle, uniqueness: true
  validates :mtitle, presence: true

  has_many :mimages, dependent: :destroy

  # searchable do
  #   text :mtitle
  # end
end
