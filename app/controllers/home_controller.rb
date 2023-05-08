class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @links = current_user.links.find_links_nearest.page(params[:page]).per(5)
  end
end
