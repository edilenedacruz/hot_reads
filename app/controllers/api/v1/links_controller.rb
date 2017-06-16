class Api::V1::LinksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: Link.where('updated_at > ?', 24.hours.ago).order(count: :desc).limit(10)
  end

  def create
    @link = Link.find_or_create_by(url: link_params[:url])
    @link.count += 1
    @link.save
    render json: Link.where('updated_at > ?', 24.hours.ago).order(count: :desc).limit(10) 
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end
end
