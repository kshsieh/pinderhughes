class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true 
#TODO investigate why email and pw tests are not failing when
#validation is commented out. most likely Devise is handling it      
  # validates :email, presence: true
  # validates :password, presence: true

  has_many :social_media_sites
  has_many :tracks
  has_many :events
  has_many :videos
end
