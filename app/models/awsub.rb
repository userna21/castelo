class Awsub < ApplicationRecord
  validates :title, :asmall, :amedium, uniqueness: true
  validates :title,  presence: true
  has_many :aimages, dependent: :destroy
end
