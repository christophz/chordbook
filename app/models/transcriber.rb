class Transcriber < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :transcriptions
  has_many :songs

  validates :name, :instruments, :email, :presence => true
  validates :instruments, :length => { :maximum => 100 }

  validates :facebook_link, :bandcamp_link, :twitter_link, :soundcloud_link, :url => true

end
