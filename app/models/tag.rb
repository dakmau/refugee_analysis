class Tag < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode
  belongs_to :post
end
