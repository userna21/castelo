class Melody < ApplicationRecord
  validates :mtitle, uniqueness: true
  validates :mtitle, presence: true
  has_many :mimages, dependent: :destroy
end
