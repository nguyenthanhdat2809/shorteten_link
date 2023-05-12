class Address < ApplicationRecord
  belongs_to :user

  def to_s
    "#{street}, #{city}, #{country}"
  end
end
