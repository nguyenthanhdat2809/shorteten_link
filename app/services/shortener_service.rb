require 'digest/sha2'

class ShortenerService
  attr_reader :url, :link_model

  def initialize(url, link_model = Link)
    @url = url
    @link_model = link_model
  end

  def generate_short_link(user)
    link_model.create(original_url: url, lookup_code: lookup_code, user_id: user.id)
  end

  def lookup_code
    loop do
      code = get_fresh_code
      break code unless link_model.exists?(lookup_code: code)
    end
  end

  private

  def get_fresh_code
    SecureRandom.uuid[0..6]
  end
end
