# encoding: utf-8
require 'mail/encodings/7bit'
require 'mail/parsers/ragel/uuencode'

module Mail
  module Encodings
    class UUEncode < SevenBit
      NAME = 'uuencode'
     
      PRIORITY = 3

      REGEXP = %r{ 
        ^begin[^\S\n]+[0-9]+[^\S\n]+\S[^\n]*\n 
        ( .*? \n )
        `\n
        end\n
      }mx
 
      def self.can_encode?(enc)
        false
      end

      # Decode the string from uuencode
      def self.decode(str)
        Mail::Parsers::Ragel::UUEncode.parse( str )
      end

      # uuencoding converts at 3 bytes in to 4 bytes out, but with extra 'special' characters.
      def self.cost(str)
        4.0 / 3.0 
      end

      Encodings.register(NAME, self)      
    end
  end
end
