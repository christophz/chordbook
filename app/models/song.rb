class Song < ActiveRecord::Base
    has_many :transcriptions, :dependent => :delete_all
    belongs_to :transcriber

    validates :originalkey, :length => { :maximum => 2 }
    validates :title, :originalkey, :musician, :presence => true
end
