# encoding: utf-8

module Mail
  class Ruby19

    # Escapes any parenthesis in a string that are unescaped this uses
    # a Ruby 1.9.1 regexp feature of negative look behind
    def Ruby19.escape_paren( str )
      re = /(?<!\\)([\(\)])/          # Only match unescaped parens
      str.gsub(re) { |s| '\\' + s }
    end

    def Ruby19.paren( str )
      str = $1 if str =~ /^\((.*)?\)$/
      str = escape_paren( str )
      '(' + str + ')'
    end

    def Ruby19.escape_bracket( str )
      re = /(?<!\\)([\<\>])/          # Only match unescaped brackets
      str.gsub(re) { |s| '\\' + s }
    end

    def Ruby19.bracket( str )
      str = $1 if str =~ /^\<(.*)?\>$/
      str = escape_bracket( str )
      '<' + str + '>'
    end

    def Ruby19.decode_base64(str)
      str.unpack( 'm' ).first
    end

    def Ruby19.encode_base64(str)
      [str].pack( 'm' )
    end

    def Ruby19.has_constant?(klass, string)
      klass.const_defined?( string, false )
    end

    def Ruby19.get_constant(klass, string)
      klass.const_get( string )
    end

    def Ruby19.b_value_encode(str, encoding = nil)
      encoding = str.encoding.to_s
      [Ruby19.encode_base64(str), encoding]
    end

    def Ruby19.encode_utf8( string )
      encoded = string.encode( Encoding::UTF_8, :invalid => :replace, :undef => :replace )
      unless encoded.valid_encoding?
        # the source lied about the encoding, reëncode so that we have a valid utf8 string
        encoded = encoded.force_encoding( Encoding::ASCII_8BIT ).encode( Encoding::UTF_8, :invalid => :replace, :undef => :replace )
      end
      encoded
    rescue Encoding::ConverterNotFoundError
      string.force_encoding(Encoding::ASCII_8BIT).encode( Encoding::UTF_8, :invalid => :replace, :undef => :replace)
    end

    def Ruby19.b_value_decode(str)
      match = str.match(/\=\?(.+)?\?[Bb]\?(.+)?\?\=/m)
      if match
        charset = match[1]
        str = Ruby19.decode_base64(match[2])
        str.force_encoding(pick_encoding(charset))
      end
      encode_utf8( str )
    end

    def Ruby19.q_value_encode(str, encoding = nil)
      encoding = str.encoding.to_s
      [Encodings::QuotedPrintable.encode(str), encoding]
    end

    def Ruby19.q_value_decode(str)
      match = str.match(/\=\?(.+)?\?[Qq]\?(.+)?\?\=/m)
      if match
        charset = match[1]
        string = match[2].gsub(/_/, '=20')
        # Remove trailing = if it exists in a Q encoding
        string = string.sub(/\=$/, '')
        str = Encodings::QuotedPrintable.decode(string)
        str.force_encoding(pick_encoding(charset))
      end
      encode_utf8( str )
    end

    def Ruby19.param_decode(str, encoding)
      string = uri_parser.unescape(str)
      string.force_encoding(encoding) if encoding
      string
    end

    def Ruby19.param_encode(str)
      encoding = str.encoding.to_s.downcase
      language = Configuration.instance.param_encode_language
      "#{encoding}'#{language}'#{uri_parser.escape(str)}"
    end

    def Ruby19.uri_parser
      @uri_parser ||= URI::Parser.new
    end

    # Pick a Ruby encoding corresponding to the message charset. Most
    # charsets have a Ruby encoding, but some need manual aliasing here.
    #
    # TODO: add this as a test somewhere:
    #   Encoding.list.map { |e| [e.to_s.upcase == pick_encoding(e.to_s.downcase.gsub("-", "")), e.to_s] }.select {|a,b| !b}
    #   Encoding.list.map { |e| [e.to_s == pick_encoding(e.to_s), e.to_s] }.select {|a,b| !b}
    def Ruby19.pick_encoding(charset)
      case charset

      # ISO-8859-8-I etc. http://en.wikipedia.org/wiki/ISO-8859-8-I
      when /^iso-?8859-(\d+)(-i)?$/i
        "ISO-8859-#{$1}"

      # ISO-8859-15, ISO-2022-JP and alike
      when /iso-?(\d{4})-?(\w{1,2})/i
        "ISO-#{$1}-#{$2}"

      # "ISO-2022-JP-KDDI"  and alike
      when /iso-?(\d{4})-?(\w{1,2})-?(\w*)/i
        "ISO-#{$1}-#{$2}-#{$3}"

      # UTF-8, UTF-32BE and alike
      when /utf[\-_]?(\d{1,2})?(\w{1,2})/i
        "UTF-#{$1}#{$2}".gsub(/\A(UTF-(?:16|32))\z/, '\\1BE')

      # Windows-1252 and alike
      when /Windows-?(.*)/i
        "Windows-#{$1}"

      when /^8bit$/
        Encoding::ASCII_8BIT

      # alternatives/misspellings of us-ascii seen in the wild
      when /^iso-?646(-us)?$/i, /us=ascii/i
        Encoding::ASCII

      # Microsoft-specific alias for MACROMAN
      when /^macintosh$/i
        Encoding::MACROMAN

      # Microsoft-specific alias for CP949 (Korean)
      when 'ks_c_5601-1987'
        Encoding::CP949

      # Wrongly written Shift_JIS (Japanese)
      when 'shift-jis'
        Encoding::Shift_JIS

      # GB2312 (Chinese charset) is a subset of GB18030 (its replacement)
      when /gb2312/i
        Encoding::GB18030

      when /euc-kr/i
        # SB-6408 EUC-KR is often actually Windows-949, aka CP949.
        # CP949 is a superset of EUC-KR, so this should be reasonably safe.
        Encoding::CP949

      when /emacs-mule|euc-tw|ibm864|windows-1258|gb1988|maccenteuro|macthai|iso-2022-jp-2|macjapanese|utf-7/i
        # These encodings have no valid transcoder for utf8
        # Generated by:
        # ruby -e 'u = Encoding::UTF_8' -e 'puts Encoding.list.find_all{|e|e != u and !Encoding::Converter.search_convpath(e, u) rescue true}'
        Encoding::ASCII_8BIT

      else
        Encoding.find( charset ) rescue Encoding::ASCII_8BIT
      end
    end
  end
end
