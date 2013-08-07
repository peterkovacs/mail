require 'spec_helper'

describe Mail::Encodings::UUEncode do
  
  it "should decode with begin and end" do
    result = "\000\000\000\000" * 1024
    encoded = [ result ].pack( 'u' ).gsub( "\n", "\r\n" )
    Mail::Encodings::UUEncode.decode("begin 0600 filename.txt\r\n#{encoded}`\r\nend\r\n").should eq result
  end

  it "should decode without begin and end" do
    result = "\000\000\000\000" * 1024
    encoded = [ result ].pack( 'u' ).gsub( "\n", "\r\n" )
    Mail::Encodings::UUEncode.decode(encoded).should eq result
  end
  
end
