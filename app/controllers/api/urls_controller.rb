class Api::UrlsController < ApiController
  def create
    @url = Url.create(url_params)

    if @url.save
      render json: {
          original_url: @url.original_url,
          short_url: request.protocol + request.host_with_port + "/" + @url.short_url,
          password: @url.password
      }, status: :created
    else
      render json: @url.errors, status: :unprocessable_entity
    end
  end

  private

  def url_params
    params.permit(:original_url)
  end
end
