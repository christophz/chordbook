class Song < ActiveRecord::Base
    has_many :transcriptions
    
    validates :originalkey, :length => { :maximum => 2 }
    validates :title, :originalkey, :musician, :presence => true
end
