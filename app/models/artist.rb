class Artist < ActiveRecord::Base
  validates :name, presence: true
  validates :image_path, presence: true
  validates :name, uniqueness: true
  has_many :songs
end
