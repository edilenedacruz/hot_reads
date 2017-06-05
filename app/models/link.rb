class Link < ApplicationRecord
  validates :url, uniquess: true

  def self.get_hot_reads
    UrlockBoxService.get_links do |link|
      link
    end
  end
end
