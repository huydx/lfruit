module Lfruit
  class BlackHole
    def method_missing(name, *args)
      ## just do nothing, because i'm blackhole!!!
    end
  end
end
