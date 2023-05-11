class User < ApplicationRecord
  attr_accessor :login

  has_many :links, dependent: :destroy
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
  has_one_attached :avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:login]

  delegate :full_name, to: :profile

  class << self
    def find_for_authentication(conditions = {})
      login = conditions.delete(:login)
      where(conditions).where(['user_name = :value OR email = :value', { value: login }]).first
    end
  end
end
