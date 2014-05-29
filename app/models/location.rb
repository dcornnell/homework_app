class Location < ActiveRecord::Base
 has_many :cohorts
 validates_presence_of :name
 validates_uniqueness_of :address

end