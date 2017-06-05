class Link < ApplicationRecord
  # validates :url, uniquess: true

  def initialize(attributes)
    binding.pry
  end

  def self.get_hot_reads
    UrlockBoxService.get_links do |data|
      Link.new(data)
    end
  end
end
