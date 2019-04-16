class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2, :facebook]

  #has_many :groups, dependent: :destroy
  has_many :orders, dependent: :destroy
  serialize :friends
  # serialize :groups
  # serialize :orders
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  def self.search(search)
		where("users.email LIKE ?", "%#{search}%")
       end
 def self.from_omniauth(auth)
              where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
                user.email = auth.info.email
                user.password = Devise.friendly_token[0, 20]
                user.name = auth.info.name   # assuming the user model has a name
                user.image = auth.info.image # assuming the user model has an image
                # If you are using confirmable and the provider(s) you use validate emails, 
                # uncomment the line below to skip the confirmation emails.
                # user.skip_confirmation!
              end
 end     
 def self.new_with_session(params, session)
       super.tap do |user|
         if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
           user.email = data["email"] if user.email.blank?
         end
       end
     end
end
