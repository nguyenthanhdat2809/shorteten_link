require "rails_helper"

RSpec.describe ShortenerService do
	it "shortens a given URL to a 7 character lookup code" do
		url = "https://viblo.asia/p/cac-cau-hoi-phong-van-ruby-on-rails-developer-phan-1-WAyK8O9m5xX"

		shortener = ShortenerService.new(url)
		expect(shortener.lookup_code.length).to eq(7)
	end

	it "gives each URL its own lookup code" do
		url = "https://viblo.asia/p/cac-cau-hoi-phong-van-ruby-on-rails-developer-phan-1-WAyK8O9m5xX"
		shortener = ShortenerService.new(url)
		code_1 = shortener.lookup_code

		url = "https://viblo.asia/p/cac-cau-hoi-phong-van-ruby-on-rails-developer-phan-2-WAyK8O9m5xX"
		shortener = ShortenerService.new(url)
		code_2 = shortener.lookup_code

		expect(code_2).not_to eq(code_1)
	end

	it "always gives the same URL the same lookup code" do
		url = "https://viblo.asia/p/cac-cau-hoi-phong-van-ruby-on-rails-developer-phan-1-WAyK8O9m5xX"
		shortener = ShortenerService.new(url)
		first_code = shortener.lookup_code

		url = "https://viblo.asia/p/cac-cau-hoi-phong-van-ruby-on-rails-developer-phan-1-WAyK8O9m5xX"
		shortener = ShortenerService.new(url)
		second_code = shortener.lookup_code

		expect(first_code).to eq(second_code)
	end
end
