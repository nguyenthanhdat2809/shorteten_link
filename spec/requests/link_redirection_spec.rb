require 'rails_helper'

RSpec.describe 'Link redirection', type: :request do
  it 'redirects to the original URL for a given short link' do
    url = 'https://viblo.asia/u/tuananh_vc'
    shortener = ShortenerService.new(url)
    link = shortener.generate_short_link

    get link.short_link

    expect(response).to redirect_to(link.original_url)
  end
end
