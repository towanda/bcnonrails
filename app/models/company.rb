class Company < ActiveRecord::Base
  include Geocodable
  
  validates_presence_of :name
  
  has_many :employees, :class_name => 'User'
  has_many :jobs
  
  before_save :geocode_location, :url_format
  
  named_scope :random, lambda { |random| {:order => "RAND()", :limit => random }}
  
  protected
    def url_format
      self.website = "http://" + self.website.to_s unless /http:\/\/|https:\/\//.match(self.website) 
    end
end
