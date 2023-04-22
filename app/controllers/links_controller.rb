class LinksController < ApplicationController
  before_action :get_links

  def show
    @link = current_user.links.find_by(lookup_code: params[:lookup_code])
    return unless @link.present?

    @link.update_count_clicked
    redirect_to @link.original_url
  end

  def create
    original_url = link_params[:original_url]
    shortener = ShortenerService.new(original_url)
    @link = shortener.generate_short_link(current_user)

    if @link.persisted?
      respond_to :js
    else
      render 'error.js.erb'
    end
  end

  private

  def link_params
    params.require(:link).permit(:original_url)
  end

  def get_links
    @links = Link.find_links_nearest
  end
end
