class Link < ApplicationRecord
  belongs_to :user

  validates_presence_of :original_url, :lookup_code
  validates_uniqueness_of :lookup_code
  validate :original_url_formatted

  scope :find_links_nearest, -> { order(created_at: :desc) }

  def update_count_clicked
    update_attribute(:count_clicked, increase)
  end

  def increase
    count_clicked + 1
  end

  def short_link
    "http://127.0.0.1:3000/#{lookup_code}"
  end

  private

  def original_url_formatted
    uri = URI.parse(original_url || '')
    errors.add(:original_url, 'Invalid URL format') if uri.host.nil?
  end
end
