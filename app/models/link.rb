class Link < ApplicationRecord
  validates_presence_of :original_url, :lookup_code
  validates_uniqueness_of :lookup_code
  validate :original_url_formatted

  def short_link
    "http://127.0.0.1:3000/#{lookup_code}"
  end

  private

  def original_url_formatted
    uri = URI.parse(original_url || "")
    errors.add(:original_url, "Invalid URL format") if uri.host.nil?
  end
end
