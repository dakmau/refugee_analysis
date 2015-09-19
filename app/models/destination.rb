class Destination < ActiveRecord::Base
  belongs_to :user
  geocoded_by :address
end
