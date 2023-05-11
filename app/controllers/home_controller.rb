class HomeController < ApplicationController
  def index
    @search = current_user.links.order(created_at: :desc).ransack(params[:q])
    @links = @search.result.page(params[:page]).per(params[:limit] || Settings.default_litmit)
  end
end
