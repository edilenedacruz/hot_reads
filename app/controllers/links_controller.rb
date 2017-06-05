class LinksController < ApplicationController
  def index
    # binding.pry
    @link = Link.get_hot_reads
  end
end
