class LinksController < ApplicationController
  def index
    @links = Link.where('updated_at > ?', 24.hours.ago).order(count: :desc).limit(10)
  end
end
