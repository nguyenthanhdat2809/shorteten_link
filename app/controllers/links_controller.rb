class LinksController < ApplicationController
	def show
		@link = Link.find_by(lookup_code: params[:lookup_code])
		if @link.present?
			@link.update_count_clicked
			redirect_to @link.original_url
		end
	end

	def create
		original_url = params[:link][:original_url]
		shortener = ShortenerService.new(original_url)
		@link = shortener.generate_short_link

		if @link.persisted?
			respond_to :js
		else
			render "error.js.erb"
		end
	end

	private

	def link_params
		params.require(:link).permit(:original_url)
	end
end
