module Rubot
  module Events
    def on(event, &block)
      events[event.to_s] << block
    end

    def trigger(event)
      events[event.to_s].each(&:call)
    end

    def events
      # key: event type, value: array of blocks to execute
      @events ||= Hash.new { |h,k| h[k] = [] }
    end
  end
end