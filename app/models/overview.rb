class Overview < ApplicationRecord
  belongs_to :user
  has_many :overviews
  has_many :physicalfindings
end
