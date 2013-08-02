# encoding: utf-8
# 
# trace           =       [return]
#                         1*received
# 
# return          =       "Return-Path:" path CRLF
# 
# path            =       ([CFWS] "<" ([CFWS] / addr-spec) ">" [CFWS]) /
#                         obs-path
# 
# received        =       "Received:" name-val-list ";" date-time CRLF
# 
# name-val-list   =       [CFWS] [name-val-pair *(CFWS name-val-pair)]
# 
# name-val-pair   =       item-name CFWS item-value
# 
# item-name       =       ALPHA *(["-"] (ALPHA / DIGIT))
# 
# item-value      =       1*angle-addr / addr-spec /
#                          atom / domain / msg-id
# 
module Mail
  class ReceivedField < UnstructuredField
    
    FIELD_NAME = 'received'
    CAPITALIZED_FIELD = 'Received'
    
    def initialize(value = nil, charset = 'utf-8')
      @charset = charset
      super(CAPITALIZED_FIELD, strip_field(FIELD_NAME, value))
      self.parse
      self
    end
  end
end
