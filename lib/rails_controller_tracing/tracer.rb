
module RailsControllerTracing
  class Tracer
    attr_reader :spans

    @@traces = {}

    def initialize
      @spans = []
    end

    def <<(line)
      @spans << line
    end

    # TODO: Unsure on this strategy for threads - might need to review later
    def self.current
      @@traces[Thread.current.object_id]
    end

    def self.current=(trace)
      @@traces[Thread.current.object_id] = trace
    end
  end
end
