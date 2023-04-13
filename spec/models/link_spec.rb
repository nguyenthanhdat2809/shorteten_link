require 'rails_helper'

RSpec.describe Link, type: :model do
  it "is valid if it has an original URL and a lookup code" do
    link = Link.new(
      original_url: "https://viblo.asia/p/cac-cau-hoi-phong-van-ruby-on-rails-developer-phan-1-WAyK8O9m5xX",
      lookup_code: "1234568"
    )
    expect(link.valid?).to be(true)
  end

  it "is invalid if the URL is not formatted properly" do
    link = Link.new(
      original_url: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
      lookup_code: "1234568"
    )
    expect(link.valid?).to be(false)
  end

  it "is valid if it does not have a lookup code" do
    link = Link.new(
      original_url: "https://viblo.asia/p/cac-cau-hoi-phong-van-ruby-on-rails-developer-phan-1-WAyK8O9m5xX"
    )
    expect(link.valid?).to be(false)
  end

  it "is valid if it does not have a lookup code" do
    link = Link.new(
      lookup_code: "1234568"
    )
    expect(link.valid?).to be(false)
  end

  it "is invalid if lookup code already exists" do
    link = Link.new(
      original_url: "https://viblo.asia/p/cac-cau-hoi-phong-van-ruby-on-rails-developer-phan-1-WAyK8O9m5xX",
      lookup_code: "1234568"
    )
    link.save

    link_2 = Link.new(
      original_url: "https://viblo.asia/p/cac-cau-hoi-phong-van-ruby-on-rails-developer-phan-2-WAyK8O9m5xX",
      lookup_code: "1234568"
    )

    expect(link_2.valid?).to be(false)
  end
end
