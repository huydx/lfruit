require 'open-uri'
require "pry"

module Lfruit
  module PageAnalytic
    extend UrlHelper

    def self.read(url, filter)
      charset = nil

      html = open(url) do |f|
        charset = f.charset
        f.read
      end

      to_fetch, to_download = [], []

      doc = Nokogiri::HTML.parse(html, nil, charset)
      doc.traverse do |node|
        src = node['src']
        href = node['href']

        [src, href].each do |u|
          next if u.nil? || email_url?(u)
          if resource_url?(u)
            to_download << full_path(url, u) if filter.pass?(u)
          elsif access_url?(u)
            to_fetch << full_path(url, u)
          end
        end

      end

      {to_fetch: to_fetch, to_download: to_download}
    rescue OpenURI::HTTPError
      warn "#{url} is not accessible"
      {to_fetch: [], to_download: []}
    end
  end
end
