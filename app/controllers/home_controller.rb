class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @search = current_user.links.ransack(params[:q])
    @links = @search.result.page(params[:page]).per(params[:limit] || Settings.default_litmit)
  end
end
