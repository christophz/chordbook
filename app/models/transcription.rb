class Transcription < ActiveRecord::Base
    belongs_to :song
    belongs_to :transcriber

    validates :level, :key, :lyrics, :presence => true
    validates :comment, :length => { :maximum => 100 }
    validates :lyrics, :length => { :maximum => 10000 }
    validates_format_of :video, :with => URI::regexp(%w(http https))

end
