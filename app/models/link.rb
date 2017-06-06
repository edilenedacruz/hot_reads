class Link

  attr_reader :url

  def initialize(data)
    @url = data[:url]

  end

  def self.get_hot_reads
    UrlockBoxService.get_links.map do |data|
      new(data)
    end
  end
end
