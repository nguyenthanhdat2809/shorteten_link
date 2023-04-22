class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @link = Link.new
    @links = current_user.links.find_links_nearest
  end
end
