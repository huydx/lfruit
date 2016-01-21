require "pry"

module Lfruit
  class Crawler
    include DefaultValue
    include LDebugger

    attr_accessor :crawl_queue,
      :location_controller,
      :base_url,
      :limit,
      :queue,
      :filter,
      :finished_queue

    def initialize(option)
      queue_size = option.parallel_num || DEFAULT_THREAD_NUM
      save_folder = option.save_folder || DEFAULT_LOCATION
      limit_loop = option.limit || DEFAULT_LIMIT
      format = option.format || DEFAULT_FORMAT

      @download_queue = Download::Queue.new(queue_size)
      @location_controller = LocationController.new(save_folder)
      @base_url = option.url
      @limit = limit_loop
      @crawl_queue = Array.new
      @finished_queue = Array.new
      @downloaded_queue = Array.new
      @filter = Filter.new(format)
    end

    def start!
      unless @base_url
        raise Exception.new("base url is null")
      end

      count = 0
      @crawl_queue.push(@base_url)

      loop do
        url = @crawl_queue.shift
        return if url.nil?

        info "going to crawl #{url}"

        count = count + 1
        break if count >= @limit

        page_result = PageAnalytic::read(url, filter)
        page_result[:to_fetch].each { |u|
          @crawl_queue.push(u) unless @finished_queue.include?(url)
        }
        page_result[:to_download].each { |l|
          @download_queue.add(l, @location_controller) unless @downloaded_queue.include?(l)
          @downloaded_queue.push(l)
        }

        @finished_queue.push(url)
      end
    rescue Exception => e
      error "error #{e.message} occurred"
    end
  end
end
