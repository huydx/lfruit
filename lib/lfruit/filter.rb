require "uri"

module Lfruit
  class BaseFilter
    def pass?(url)
      raise NotImplementedException.new
    end
  end

  class FormatFilter < BaseFilter
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

  class PatternFilter < BaseFilter
    attr_accessor :pattern
    include UrlHelper

    def initialize(pattern)
      @pattern = pattern
    end

    def pass?(url)
      @pattern.nil? ? true : !!Regexp.new(@pattern).match(url)
    end
  end
end
