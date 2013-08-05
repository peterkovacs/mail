# encoding: utf-8
# 
# keywords        =       "Keywords:" unstructured CRLF
module Mail
  class KeywordsField < UnstructuredField
    
    FIELD_NAME = 'keywords'
    CAPITALIZED_FIELD = 'Keywords'
    
    def initialize(value = nil, charset = 'utf-8')
      self.charset = charset
      super(CAPITALIZED_FIELD, strip_field(FIELD_NAME, value), charset)
    end

  end
end
