require 'optparse'

module Lfruit
  class Option
    attr_accessor :url,
      :save_folder,
      :delay,
      :format,
      :limit,
      :exclude_pattern,
      :pattern,
      :same_domain,
      :parallel_num
  end

  module OptParser
    def self.parse(args)
      option = Option.new

      OptionParser.new do |opt|
        opt.on('--url START_URL') do |v|
          option.url = v
        end

        opt.on('--save_folder SAVE_FOLDER_PATH') do |v|
          option.save_folder = v
        end

        opt.on('--format FORMAT_TO_CRAWL') do |v|
          option.format = v
        end

        opt.on('--delay [DELAY_TIME_BETWEEN_FETCH]') do |v|
          option.delay = v
        end

        opt.on('--limit [NUMBER_OF_TIMES_TO_CRAWL]') do |v|
          option.limit = v
        end

        opt.on('--exclude [EXCLUDE_PATTERN]') do |v|
          option.exclude_pattern = v
        end

        opt.on('--pattern [INCLUDE_PATTERN]') do |v|
          option.pattern = v
        end

        opt.on('--same_domain [IS_SAME_DOMAIN]') do |v|
          option.same_domain = v
        end

        opt.on('--parallel_num [NUM_OF_THREAD]') do |v|
          option.parallel_num = v
        end

        opt.parse!(args)
      end

      return option
    end
  end
end
