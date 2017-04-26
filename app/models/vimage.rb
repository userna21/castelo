class Vimage < ApplicationRecord
  belongs_to :movieu
  validates :url, :movieu_id, uniqueness: true
  validates :url, presence: true
end
