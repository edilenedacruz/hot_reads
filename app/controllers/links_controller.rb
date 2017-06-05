class LinksController < ApplicationController
  def index
    @links = Link.get_hot_reads
  end

  # def create
  #
  # end
end
