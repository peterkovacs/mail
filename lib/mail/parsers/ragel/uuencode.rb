
# line 1 "/Users/peter/src/mail/lib/mail/parsers/ragel/uuencode.rb.rl"

# line 20 "/Users/peter/src/mail/lib/mail/parsers/ragel/uuencode.rb.rl"


module Mail
  module Parsers
    module Ragel
      module UUEncode
        
# line 13 "/Users/peter/src/mail/lib/mail/parsers/ragel/uuencode.rb"
class << self
	attr_accessor :_uuencode_trans_keys
	private :_uuencode_trans_keys, :_uuencode_trans_keys=
end
self._uuencode_trans_keys = [
	0, 0, 10, 96, 10, 96, 
	110, 110, 100, 100, 10, 
	13, 10, 10, 10, 10, 
	10, 10, 69, 101, 71, 103, 
	73, 105, 78, 110, 9, 
	57, -128, 127, 10, 10, 
	32, 98, 32, 96, 32, 101, 
	0, 0, 32, 96, 0
]

class << self
	attr_accessor :_uuencode_key_spans
	private :_uuencode_key_spans, :_uuencode_key_spans=
end
self._uuencode_key_spans = [
	0, 87, 87, 1, 1, 4, 1, 1, 
	1, 33, 33, 33, 33, 49, 256, 1, 
	67, 65, 70, 0, 65
]

class << self
	attr_accessor :_uuencode_index_offsets
	private :_uuencode_index_offsets, :_uuencode_index_offsets=
end
self._uuencode_index_offsets = [
	0, 0, 88, 176, 178, 180, 185, 187, 
	189, 191, 225, 259, 293, 327, 377, 634, 
	636, 704, 770, 841, 842
]

class << self
	attr_accessor :_uuencode_indicies
	private :_uuencode_indicies, :_uuencode_indicies=
end
self._uuencode_indicies = [
	0, 1, 1, 2, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 1, 
	4, 1, 1, 5, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 1, 
	6, 1, 7, 1, 8, 1, 1, 9, 
	1, 8, 1, 4, 1, 0, 1, 10, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 10, 
	1, 11, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 11, 1, 12, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 12, 1, 13, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 13, 1, 13, 
	1, 13, 13, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 13, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 14, 14, 
	14, 14, 14, 14, 14, 14, 14, 14, 
	1, 14, 14, 14, 14, 14, 14, 14, 
	14, 14, 14, 14, 14, 14, 14, 14, 
	14, 14, 14, 14, 14, 14, 14, 14, 
	14, 14, 14, 14, 14, 14, 14, 14, 
	14, 14, 14, 14, 14, 14, 14, 14, 
	14, 14, 14, 14, 14, 14, 14, 14, 
	14, 14, 14, 14, 14, 14, 14, 14, 
	14, 14, 14, 14, 14, 14, 14, 14, 
	14, 14, 14, 14, 14, 14, 14, 14, 
	14, 14, 14, 14, 14, 14, 14, 14, 
	14, 14, 14, 14, 14, 14, 14, 14, 
	14, 14, 14, 14, 14, 14, 14, 14, 
	14, 14, 14, 14, 14, 14, 14, 14, 
	14, 14, 14, 14, 14, 14, 14, 14, 
	14, 14, 14, 14, 14, 14, 14, 14, 
	14, 14, 14, 14, 14, 14, 14, 14, 
	14, 14, 14, 14, 14, 14, 14, 14, 
	14, 14, 14, 15, 14, 14, 16, 14, 
	14, 14, 14, 14, 14, 14, 14, 14, 
	14, 14, 14, 14, 14, 14, 14, 14, 
	14, 14, 14, 14, 14, 14, 14, 14, 
	14, 14, 14, 14, 14, 14, 14, 14, 
	14, 14, 14, 14, 14, 14, 14, 14, 
	14, 14, 14, 14, 14, 14, 14, 14, 
	14, 14, 14, 14, 14, 14, 14, 14, 
	14, 14, 14, 14, 14, 14, 14, 14, 
	14, 14, 14, 14, 14, 14, 14, 14, 
	14, 14, 14, 14, 14, 14, 14, 14, 
	14, 14, 14, 14, 14, 14, 14, 14, 
	14, 14, 14, 14, 14, 14, 14, 14, 
	14, 14, 14, 14, 14, 14, 14, 14, 
	14, 14, 14, 14, 14, 14, 14, 14, 
	14, 1, 15, 1, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 17, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 18, 1, 17, 1, 
	19, 19, 19, 19, 19, 19, 19, 19, 
	19, 19, 19, 19, 19, 19, 19, 19, 
	19, 19, 19, 19, 19, 19, 19, 19, 
	19, 19, 19, 19, 19, 19, 19, 19, 
	19, 19, 19, 19, 19, 19, 19, 19, 
	19, 19, 19, 19, 19, 19, 19, 19, 
	19, 19, 19, 19, 19, 19, 19, 19, 
	19, 19, 19, 19, 19, 19, 19, 19, 
	20, 1, 19, 19, 19, 19, 19, 19, 
	19, 19, 19, 19, 19, 19, 19, 19, 
	19, 19, 19, 19, 19, 19, 19, 19, 
	19, 19, 19, 19, 19, 19, 19, 19, 
	19, 19, 19, 19, 19, 19, 19, 19, 
	19, 19, 19, 19, 19, 19, 19, 19, 
	19, 19, 19, 19, 19, 19, 19, 19, 
	19, 19, 19, 19, 19, 19, 19, 19, 
	19, 19, 20, 1, 1, 1, 1, 21, 
	1, 1, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 3, 3, 3, 3, 3, 3, 
	3, 3, 18, 1, 0
]

class << self
	attr_accessor :_uuencode_trans_targs
	private :_uuencode_trans_targs, :_uuencode_trans_targs=
end
self._uuencode_trans_targs = [
	17, 0, 8, 1, 18, 7, 4, 5, 
	19, 6, 10, 11, 12, 13, 14, 20, 
	15, 9, 2, 1, 2, 3
]

class << self
	attr_accessor :_uuencode_trans_actions
	private :_uuencode_trans_actions, :_uuencode_trans_actions=
end
self._uuencode_trans_actions = [
	1, 0, 1, 1, 1, 1, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 1, 3, 3, 0
]

class << self
	attr_accessor :_uuencode_eof_actions
	private :_uuencode_eof_actions, :_uuencode_eof_actions=
end
self._uuencode_eof_actions = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 2, 2, 0, 0
]

class << self
	attr_accessor :uuencode_start
end
self.uuencode_start = 16;
class << self
	attr_accessor :uuencode_first_final
end
self.uuencode_first_final = 16;
class << self
	attr_accessor :uuencode_error
end
self.uuencode_error = 0;

class << self
	attr_accessor :uuencode_en_main
end
self.uuencode_en_main = 16;


# line 27 "/Users/peter/src/mail/lib/mail/parsers/ragel/uuencode.rb.rl"

        def self.parse(data)
          p = 0
          stack = []

          parsed = []
          result = ''
          data = Utilities::ParseBuffer.new( data )
          eof = data.length
          
# line 230 "/Users/peter/src/mail/lib/mail/parsers/ragel/uuencode.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = uuencode_start
end

# line 37 "/Users/peter/src/mail/lib/mail/parsers/ragel/uuencode.rb.rl"
          
# line 239 "/Users/peter/src/mail/lib/mail/parsers/ragel/uuencode.rb"
begin
	testEof = false
	_slen, _trans, _keys, _inds, _acts, _nacts = nil
	_goto_level = 0
	_resume = 10
	_eof_trans = 15
	_again = 20
	_test_eof = 30
	_out = 40
	while true
	if _goto_level <= 0
	if p == pe
		_goto_level = _test_eof
		next
	end
	if cs == 0
		_goto_level = _out
		next
	end
	end
	if _goto_level <= _resume
	_keys = cs << 1
	_inds = _uuencode_index_offsets[cs]
	_slen = _uuencode_key_spans[cs]
	_trans = if (   _slen > 0 && 
			_uuencode_trans_keys[_keys] <= ( data.at(p)) && 
			( data.at(p)) <= _uuencode_trans_keys[_keys + 1] 
		    ) then
			_uuencode_indicies[ _inds + ( data.at(p)) - _uuencode_trans_keys[_keys] ] 
		 else 
			_uuencode_indicies[ _inds + _slen ]
		 end
	cs = _uuencode_trans_targs[_trans]
	if _uuencode_trans_actions[_trans] != 0
	case _uuencode_trans_actions[_trans]
	when 1 then
# line 3 "/Users/peter/src/mail/lib/mail/parsers/ragel/uuencode.rb.rl"
		begin
 parsed.push( data.at(p).ord ) 		end
	when 3 then
# line 4 "/Users/peter/src/mail/lib/mail/parsers/ragel/uuencode.rb.rl"
		begin

    result += parsed.pack( 'c*' ).unpack( 'u' )[0]
    parsed.clear
  		end
# line 3 "/Users/peter/src/mail/lib/mail/parsers/ragel/uuencode.rb.rl"
		begin
 parsed.push( data.at(p).ord ) 		end
# line 289 "/Users/peter/src/mail/lib/mail/parsers/ragel/uuencode.rb"
	end
	end
	end
	if _goto_level <= _again
	if cs == 0
		_goto_level = _out
		next
	end
	p += 1
	if p != pe
		_goto_level = _resume
		next
	end
	end
	if _goto_level <= _test_eof
	if p == eof
	  case _uuencode_eof_actions[cs]
	when 2 then
# line 4 "/Users/peter/src/mail/lib/mail/parsers/ragel/uuencode.rb.rl"
		begin

    result += parsed.pack( 'c*' ).unpack( 'u' )[0]
    parsed.clear
  		end
# line 314 "/Users/peter/src/mail/lib/mail/parsers/ragel/uuencode.rb"
	  end
	end

	end
	if _goto_level <= _out
		break
	end
end
	end

# line 38 "/Users/peter/src/mail/lib/mail/parsers/ragel/uuencode.rb.rl"

          if p == eof && cs >= 
# line 328 "/Users/peter/src/mail/lib/mail/parsers/ragel/uuencode.rb"
16
# line 39 "/Users/peter/src/mail/lib/mail/parsers/ragel/uuencode.rb.rl"

            return result
          else
            return data.to_s
          end
        end
      end
    end
  end
end
