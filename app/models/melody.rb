class Melody < ApplicationRecord
  validates :mtitle, :msmall, :mmedium, uniqueness: true
  validates :mtitle, :msinop, presence: true

  has_many :mimages, dependent: :destroy
end
