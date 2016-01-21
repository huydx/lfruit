require 'open-uri'

module Lfruit
  module Download
    class Worker
      include Celluloid
      include LDebugger

      def download(path, locator)
        download_to = locator.from(path)

        open(download_to, "wb") do |output|
          open(path) do |data|
            output.write(data.read)
          end
        end
      rescue OpenURI::HTTPError
        warn "warn: #{path} is no longer exist"
      end
    end

    class Queue
      include LDebugger
      attr_accessor :pool

      def initialize(size)
        @pool = Worker.pool(size: size)
      end

      def add(url, locator)
        info "add url to pool: #{url}"
        @pool.download(url, locator)
      end
    end
  end
end
