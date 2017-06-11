class Api::V1::LinksController < ApplicationController
  def index
    render json: Link.all
  end

  def create
    @link = Link.find_or_create_by(url: link_params[:url])
    @link.count += 1
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end
end
