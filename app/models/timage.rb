class Timage < ApplicationRecord
  validates :url, :tonan_id, uniqueness: true
  belongs_to :tonan
end
