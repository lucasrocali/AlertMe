class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_create :generate_authentication_token!

   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	 has_many :locations, dependent: :destroy

	 validates_presence_of :name, :email
	 validates_presence_of :password, :on => :create
	 validates :auth_token, uniqueness: true

	 def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end
end
