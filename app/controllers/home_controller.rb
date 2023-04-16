class HomeController < ApplicationController
  def index
    @link = Link.new
    @links = Link.find_links_nearest
  end
end
