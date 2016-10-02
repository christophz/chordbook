class Transcriber < ActiveRecord::Base
    has_many :transcriptions

    validates :name, :instruments, :email, :presence => true
    validates :instruments, :length => { :maximum => 100 }
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

end
