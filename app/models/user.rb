class User < ApplicationRecord
  devise :omniauthable, :omniauth_providers => [:facebook]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :tweets
         has_many :items
         validates :username,presence: true,uniqueness: true, length: {minimum: 6}
          validates :name,presence: true
          acts_as_followable
            acts_as_follower
            acts_as_voter
               def self.from_omniauth(auth)
                  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
                  user.email = auth.info.email
                  user.password = Devise.friendly_token[0,20]
                end
               end


end
