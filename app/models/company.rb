class Company < ActiveRecord::Base
  include Geocodable
  
  validates_presence_of :name
  
  has_many :employees, :class_name => 'User'
  has_many :jobs
  
  before_save :geocode_location
end
