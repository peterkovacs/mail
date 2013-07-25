# encoding: utf-8
module Mail
  class ReceivedElement
    
    include Mail::Utilities
    
    def initialize( string )
      received = Mail::Parsers::ReceivedParser.new.parse(string)
      if received.date && received.time
        @date_time = ::DateTime.parse("#{received.date} #{received.time}")
      end
      @info = received.info.join( ' ' )
    end
    
    def date_time
      @date_time
    end
    
    def info
      @info
    end
    
    def to_s(*args)
      "#{@info}; #{@date_time.to_s(*args)}"
    end
    
  end
end
