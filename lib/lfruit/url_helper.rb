require "uri"

module Lfruit
  module UrlHelper
    extend LDebugger

    def try_parse(url)
      URI.parse(url)
    rescue URI::InvalidURIError
      BlackHole.new
    end

    def is_relative_path?(url)
      return true if !url.include?("http") && !url.include?("https")
      parsed = try_parse(url)
      parsed.path != nil && parsed.host.nil?
    end

    def full_path(base, path)
      if is_relative_path?(path)
        URI.join(base, path).to_s
      else
        path
      end
    end

    def resource_url?(url)
      path = try_parse(url).path
      path.nil? ? false : (!!File.extname(path) && !File.extname(path).include?('htm'))
    end

    def email_url?(url)
      !url.nil? && url.include?("mailto")
    end

    def access_url?(url)
      (!resource_url? (url) && !email_url?(url)) ||
      (url.include?("htm") || url.end_with?("/"))
    end
  end

  extend UrlHelper
end
