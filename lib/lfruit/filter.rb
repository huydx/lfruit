require "uri"

module Lfruit
  class Filter
    attr_accessor :extension
    include UrlHelper

    def initialize(format)
      @extension = format
    end

    def pass?(url)
      if (try_parse(url).path)
        url_format = File.extname(URI.parse(url).path)
        url_format.include?(@extension)
      else
        false
      end
    end
  end
end
