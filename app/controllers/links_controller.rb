class LinksController < ApplicationController
	def create
		original_url = params[:link][:original_url]
		shortener = ShortenerService.new(original_url)
		@link = shortener.generate_short_link
	end

	private

	def link_params
		params.require(:link).permit(:original_url)
	end
end
