%%{
  machine content_transfer_encoding;

  include rb_actions "rb_actions.rl";
  include common "../../common.rl";

  getkey data.at(p);
  alphtype int;

  main := content_transfer_encoding;
}%%

module Mail
  module Parsers
    module Ragel
      module ContentTransferEncodingMachine
        %%write data;

        def self.parse(data)
          p = 0
          stack = []

          actions = []
          data = Utilities::ParseBuffer.new( data )
          eof = data.length
          %%write init;
          %%write exec;

          if p == eof && cs >= %%{ write first_final; }%%
            return actions, nil
          else
            return [], "Only able to parse up to #{data[0..p]}/#{p} but should have gotten to #{eof}"
          end
        end
      end
    end
  end
end
