class Profile < ApplicationRecord
  belongs_to :user

  def full_name
    "#{self.last_name} #{self.first_name}"
  end
end
