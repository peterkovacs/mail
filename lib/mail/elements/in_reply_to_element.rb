# encoding: utf-8
module Mail
  class InReplyToElement
    
    include Mail::Utilities
    
    def initialize(string)
      @message_ids = Mail::Parsers::InReplyToParser.new.parse(string).message_ids
    end
    
    def message_ids
      @message_ids
    end
    
    def message_id
      @message_ids.first
    end
    
  end
end
