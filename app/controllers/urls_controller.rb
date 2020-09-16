class UrlsController < ApplicationController
  def show
    @url = Url.find_by_short_url(params[:short_url])
    if @url.nil?
      render status: 404
    else
      @url.update_attribute(:click, @url.click + 1)
      redirect_to @url.original_url
    end
  end
end
