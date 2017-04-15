class Mimage < ApplicationRecord
  validates :url, :melody_id, uniqueness: true
  belongs_to :melody
  
end
