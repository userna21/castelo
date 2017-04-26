class Mistream < ApplicationRecord
  belongs_to :melody

  validates :url, :melody_id, uniqueness: true
end
