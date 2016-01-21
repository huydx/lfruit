%w(
  nokogiri
  celluloid/current
  active_support
  colorize
  active_support/core_ext
  active_support/dependencies
).each { |lib| require lib }

Thread.abort_on_exception = true
Encoding.default_external = Encoding.find('UTF-8')

%w(
  core_ext
  default
  debugger
  url_helper
  empty_class
  option
  downloader
  filter
  location
  page_analytic
  crawler
  version
).each { |file| require_dependency File.expand_path("../lfruit/#{file}", __FILE__) }
