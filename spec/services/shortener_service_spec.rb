require 'rails_helper'

RSpec.describe ShortenerService do
  it 'shortens a given URL to a 7 character lookup code' do
    url = 'https://viblo.asia/p/cac-cau-hoi-phong-van-ruby-on-rails-developer-phan-1-WAyK8O9m5xX'

    shortener = ShortenerService.new(url)
    expect(shortener.lookup_code.length).to eq(7)
  end

  it 'gives each URL its own lookup code' do
    url = 'https://viblo.asia/p/cac-cau-hoi-phong-van-ruby-on-rails-developer-phan-1-WAyK8O9m5xX'
    shortener = ShortenerService.new(url)
    code_1 = shortener.lookup_code

    url = 'https://viblo.asia/p/cac-cau-hoi-phong-van-ruby-on-rails-developer-phan-2-WAyK8O9m5xX'
    shortener = ShortenerService.new(url)
    code_2 = shortener.lookup_code

    expect(code_2).not_to eq(code_1)
  end

  it 'generates a Link record with a unique lookup code' do
    url = 'https://viblo.asia/p/cac-cau-hoi-phong-van-ruby-on-rails-developer-phan-1-WAyK8O9m5xX'
    shortener = ShortenerService.new(url)
    link = shortener.generate_short_link
    expect(link.valid?).to be(true)

    link_2 = shortener.generate_short_link
    expect(link_2.valid?).to be(true)
  end
end
