class Oimage < ApplicationRecord
  validates :url, :oploverz_id, uniqueness: true
  belongs_to :oploverz
end
