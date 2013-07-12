# encoding: utf-8
module Mail
  class InReplyToElement
    
    include Mail::Utilities
    
    def initialize(string)
      parser = Mail::InReplyToParser.new
      if tree = parser.parse(string)
        @message_ids = tree.message_ids.map { |msg_id| msg_id.text_value }
      else
        raise Mail::Field::ParseError, "InReplyToElement can not parse |#{string}|\nReason was: #{parser.failure_reason}\n"
      end
    end
    
    def message_ids
      @message_ids
    end
    
    def message_id
      @message_ids.first
    end
    
  end
end
