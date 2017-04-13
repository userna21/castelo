class Awsub < ApplicationRecord
  validates :title, :asmall, :amedium, uniqueness: true
  validates :asmall, :sinop, presence: true
  has_many :aimages, dependent: :destroy
  
end
