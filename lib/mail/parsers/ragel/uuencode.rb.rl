%%{
  machine uuencode;
  action line { parsed.push( data.at(p).ord ) }
  action decode {
    result += parsed.pack( 'c*' ).unpack( 'u' )[0]
    parsed.clear
  }

  EOL = ( "\r\n" | "\n" );
  begin = "begin"i ( space - [\r\n] )* digit+ ( space - [\r\n] )* ( extend - [\r\n] )* EOL;
  data = 0x20 .. 0x60;
  lines = ( data+ EOL ) $line %decode;
  end = "`" EOL "end" EOL;

  getkey data.at(p);
  alphtype int;

  main := begin? <: lines* :>> end?;

}%%

module Mail
  module Parsers
    module Ragel
      module UUEncode
        %%write data;

        def self.parse(data)
          p = 0
          stack = []

          parsed = []
          result = ''
          data = Utilities::ParseBuffer.new( data )
          eof = data.length
          %%write init;
          %%write exec;

          if p == eof && cs >= %%{ write first_final; }%%
            return result
          else
            return data.to_s
          end
        end
      end
    end
  end
end
