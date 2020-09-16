class Api::UrlsController < ApiController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @urls = Url.all

    render json: @urls.map{ |url|
      {
          id: url.id,
          original_url: url.original_url,
          short_url: url.short_url,
          click: url.click
      }
    }
  end

  def show
    render json: {
        id: @url.id,
        original_url: @url.original_url,
        short_url: @url.short_url,
        click: @url.click
    }
  end

  def create
    @url = Url.create(url_params)

    if @url.save
      render json: {
          id: @url.id,
          original_url: @url.original_url,
          short_url: request.protocol + request.host_with_port + "/" + @url.short_url,
          password: @url.password
      }, status: :created
    else
      render json: @url.errors, status: :unprocessable_entity
    end
  end

  def update
    if @url.password == params[:password]
      if @url.update(url_params)
        render json: {
            id: @url.id,
            original_url: @url.original_url,
            short_url: request.protocol + request.host_with_port + "/" + @url.short_url,
            password: @url.password
        }
      else
        render json: @url.errors, status: :unprocessable_entity
      end
    else
      render status: :forbidden
    end
  end

  def destroy
    if @url.password == params[:password]
      @url.destroy
    else
      render status: :forbidden
    end
  end

  private

  def set_user
    @url = Url.find(params[:id])
  end

  def url_params
    params.permit(:original_url)
  end
end
