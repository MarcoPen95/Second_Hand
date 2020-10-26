class Seller < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:stripe_connect]
  

  has_many :notifications, foreign_key: :recipient_id
  has_many :announcements , dependent: :destroy
  has_many :messages
  has_many :conversations, foreign_key: :sender_id
  has_many :orders
  has_one_attached :avatar

  validates :username, presence: true
  validates :email, presence: true

  def can_receive_payments?
    uid? && provider? && access_code && publishable_key?
   
  end


  
end