class Ostream < ApplicationRecord
  belongs_to :oploverz

  validates :link, :oploverz_id, uniqueness: true
end
