class Melody < ApplicationRecord
  validates :mtitle, uniqueness: true
  validates :mtitle, presence: true
  has_many :mimages, dependent: :destroy
  has_many :mistreams, dependent: :destroy

  # searchable do
  #   text :mtitle
  # end
end
