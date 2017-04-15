class Limage < ApplicationRecord
  belongs_to :same
  validates :url, :same_id, uniqueness: true
end
