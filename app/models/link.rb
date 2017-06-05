class Link < ApplicationRecord
  validates :url, uniquess: true

  def initialize(attributes)
    binding.pry
  end

  def self.get_hot_reads
    UrlockBoxService.get_links do |link|
      Link.new(attributes)
    end
  end
end
