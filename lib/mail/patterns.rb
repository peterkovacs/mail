# encoding: us-ascii
module Mail
  module Patterns
    white_space = %Q|\x9\x20|
    text        = %Q|\x1-\x8\xB\xC\xE-\x7f|
    field_name  = %Q|\x21-\x39\x3b-\x7e|
    qp_safe     = %Q|\x20-\x3c\x3e-\x7e|
    
    aspecial     = %Q|()<>[]:;@\\,."| # RFC5322
    tspecial     = %Q|()<>@,;:\\"/[]?=| # RFC2045
    sp           = %Q| |
    control      = %Q|\x00-\x1f\x7f-\xff|
    
    if control.respond_to?(:force_encoding)
      control = control.force_encoding(Encoding::BINARY)
    end
    
    CRLF          = /\r\n/
    WSP           = /[#{white_space}]/o
    FWS           = /#{CRLF}#{WSP}*/o
    TEXT          = /[#{text}]/o # + obs-texto
    FIELD_NAME    = /[#{field_name}]+/o
    FIELD_PREFIX  = /\A(#{FIELD_NAME})/o
    FIELD_BODY    = /.+/mo
    FIELD_LINE    = /^[#{field_name}]+:\s*.+$/o
    FIELD_SPLIT   = /^(#{FIELD_NAME})\s*:\s*(#{FIELD_BODY})?$/o
    HEADER_LINE   = /^([#{field_name}]+:\s*.+)$/o
    HEADER_SPLIT  = /#{CRLF}(?!#{WSP})/o

    QP_UNSAFE     = /[^#{qp_safe}]/o
    QP_SAFE       = /[#{qp_safe}]/o
    CONTROL_CHAR  = /[#{control}]/no
    ATOM_UNSAFE   = /[#{Regexp.quote aspecial}#{control}#{sp}]/no
    PHRASE_UNSAFE = /[#{Regexp.quote aspecial}#{control}]/no
    TOKEN_UNSAFE  = /[#{Regexp.quote tspecial}#{control}#{sp}]/no
  end
end
