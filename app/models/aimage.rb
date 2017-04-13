class Aimage < ApplicationRecord
  validates :url, :awsub_id, uniqueness: true
  belongs_to :awsub
end
