class User < ApplicationRecord
  attr_accessor :login

  has_many :links
  has_one_attached :avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:login]

  class << self
    def find_for_authentication(conditions = {})
      login = conditions.delete(:login)
      where(conditions).where(['user_name = :value OR email = :value', { value: login }]).first
    end
  end
end
