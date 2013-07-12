# encoding: utf-8
module Mail
  class ReceivedElement
    
    include Mail::Utilities
    
    def initialize( string )
      parser = Mail::ReceivedParser.new
      if tree = parser.parse(string)
        if tree.elements[1].respond_to?(:date_time)
          @date_time = ::DateTime.parse("#{tree.elements[1].date_time.date.text_value} #{tree.elements[1].date_time.time.text_value}")
        end
        @info = tree.name_val_list.text_value
      else
        raise Mail::Field::ParseError, "ReceivedElement can not parse |#{string}|\nReason was: #{parser.failure_reason}\n"
      end
    end
    
    def date_time
      @date_time
    end
    
    def info
      @info
    end
    
    def to_s(*args)
      if @date_time.present?
        "#{@info}; #{@date_time.to_s(*args)}"
      else
        @info
      end
    end
    
  end
end
