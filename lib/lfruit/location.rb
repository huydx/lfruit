require 'uri'

module Lfruit
  class LocationController
    attr_accessor :base

    def initialize(base)
      @base = base
    end

    def from(url)
      fname = File.basename(url)
      @base + "/" + fname
    end
  end
end
