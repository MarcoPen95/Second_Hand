class Buyer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
<<<<<<< HEAD
         :recoverable, :rememberable, :validatable

  has_many :favorites
  has_many :transactions
  has_many :messages
  has_many :conversations, foreign_key: :sender_id
=======
         :recoverable, :rememberable, :validatable,
         :omniauthable 
  
  validates :username, presence: true
  validates :email, presence: true

  def self.from_omniauth(auth)
    buyer = Buyer.where(providers: auth.provider, uid: auth.uid).first
    if buyer.present?
      buyer
    else
      # Check wether theres is already a user with the same
      # email address
      buyer_with_email = Buyer.find_by_email(auth.info.email)

      if buyer_with_email.present?
        buyer = buyer_with_email
      else

        buyer = Buyer.new

       
        if auth.provider == "google_oauth2"
          buyer.providers = auth.provider
          buyer.uid = auth.uid
          buyer.username = auth.info.name
          buyer.email = auth.info.email
          buyer.password = Devise.friendly_token[0,20]
          buyer.save!
        end

      end
    end
    return buyer
  end
>>>>>>> a7201da46f17462f501df17ed01855735e2456cf
end
