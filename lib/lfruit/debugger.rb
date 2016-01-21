module Lfruit
  module LDebugger
    def info(msg)
      puts "[info] #{msg.colorize(:green)}"
    end

    def warn(msg)
      puts "[warn] #{msg.colorize(:yellow)}"
    end

    def debug(msg)
      puts "[debug] #{msg.colorize(:light_blue)}"
    end

    def error(msg)
      puts "[error] #{msg.colorize(:red)}"
    end
  end

  extend LDebugger
end
