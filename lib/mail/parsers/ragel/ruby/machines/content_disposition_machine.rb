
# line 1 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/content_disposition_machine.rb.rl"

# line 11 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/content_disposition_machine.rb.rl"


module Mail
  module Parsers
    module Ragel
      module ContentDispositionMachine
        
# line 13 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/content_disposition_machine.rb"
class << self
	attr_accessor :_content_disposition_trans_keys
	private :_content_disposition_trans_keys, :_content_disposition_trans_keys=
end
self._content_disposition_trans_keys = [
	0, 0, 9, 59, 10, 10, 
	9, 32, 9, 59, 9, 
	126, 10, 10, 9, 32, 
	33, 126, 9, 126, 9, 40, 
	10, 10, 9, 32, 1, 
	244, 1, 244, 10, 10, 
	9, 32, 10, 10, 9, 32, 
	0, 244, 128, 191, 160, 
	191, 128, 191, 128, 159, 
	144, 191, 128, 191, 128, 143, 
	9, 40, 10, 10, 9, 
	32, 9, 126, 1, 244, 
	1, 244, 10, 10, 9, 32, 
	0, 244, 128, 191, 160, 
	191, 128, 191, 128, 159, 
	144, 191, 128, 191, 128, 143, 
	9, 126, 9, 59, 9, 
	59, 9, 126, 9, 59, 
	9, 59, 9, 126, 0, 0, 
	0
]

class << self
	attr_accessor :_content_disposition_key_spans
	private :_content_disposition_key_spans, :_content_disposition_key_spans=
end
self._content_disposition_key_spans = [
	0, 51, 1, 24, 51, 118, 1, 24, 
	94, 118, 32, 1, 24, 244, 244, 1, 
	24, 1, 24, 245, 64, 32, 64, 32, 
	48, 64, 16, 32, 1, 24, 118, 244, 
	244, 1, 24, 245, 64, 32, 64, 32, 
	48, 64, 16, 118, 51, 51, 118, 51, 
	51, 118, 0
]

class << self
	attr_accessor :_content_disposition_index_offsets
	private :_content_disposition_index_offsets, :_content_disposition_index_offsets=
end
self._content_disposition_index_offsets = [
	0, 0, 52, 54, 79, 131, 250, 252, 
	277, 372, 491, 524, 526, 551, 796, 1041, 
	1043, 1068, 1070, 1095, 1341, 1406, 1439, 1504, 
	1537, 1586, 1651, 1668, 1701, 1703, 1728, 1847, 
	2092, 2337, 2339, 2364, 2610, 2675, 2708, 2773, 
	2806, 2855, 2920, 2937, 3056, 3108, 3160, 3279, 
	3331, 3383, 3502
]

class << self
	attr_accessor :_content_disposition_indicies
	private :_content_disposition_indicies, :_content_disposition_indicies=
end
self._content_disposition_indicies = [
	0, 1, 1, 1, 2, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 0, 
	1, 1, 1, 1, 1, 1, 1, 3, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 4, 1, 5, 1, 0, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 0, 1, 6, 
	1, 1, 1, 7, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 6, 1, 
	1, 1, 1, 1, 1, 1, 8, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 9, 1, 4, 1, 1, 1, 10, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 4, 11, 11, 11, 11, 11, 
	11, 11, 12, 1, 11, 11, 11, 11, 
	11, 1, 11, 11, 11, 11, 11, 11, 
	11, 11, 11, 11, 1, 1, 1, 1, 
	1, 1, 1, 11, 11, 11, 11, 11, 
	11, 11, 11, 11, 11, 11, 11, 11, 
	11, 11, 11, 11, 11, 11, 11, 11, 
	11, 11, 11, 11, 11, 1, 1, 1, 
	11, 11, 11, 11, 11, 11, 11, 11, 
	11, 11, 11, 11, 11, 11, 11, 11, 
	11, 11, 11, 11, 11, 11, 11, 11, 
	11, 11, 11, 11, 11, 11, 11, 11, 
	11, 1, 13, 1, 4, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 4, 1, 14, 14, 14, 
	14, 14, 14, 14, 1, 1, 14, 14, 
	14, 14, 14, 1, 14, 14, 14, 14, 
	14, 14, 14, 14, 14, 14, 1, 1, 
	1, 15, 1, 1, 1, 14, 14, 14, 
	14, 14, 14, 14, 14, 14, 14, 14, 
	14, 14, 14, 14, 14, 14, 14, 14, 
	14, 14, 14, 14, 14, 14, 14, 1, 
	1, 1, 14, 14, 14, 14, 14, 14, 
	14, 14, 14, 14, 14, 14, 14, 14, 
	14, 14, 14, 14, 14, 14, 14, 14, 
	14, 14, 14, 14, 14, 14, 14, 14, 
	14, 14, 14, 1, 16, 1, 1, 1, 
	17, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 16, 18, 19, 18, 18, 
	18, 18, 18, 20, 1, 18, 18, 18, 
	18, 18, 1, 18, 18, 18, 18, 18, 
	18, 18, 18, 18, 18, 1, 1, 1, 
	18, 1, 1, 1, 18, 18, 18, 18, 
	18, 18, 18, 18, 18, 18, 18, 18, 
	18, 18, 18, 18, 18, 18, 18, 18, 
	18, 18, 18, 18, 18, 18, 1, 1, 
	1, 18, 18, 18, 18, 18, 18, 18, 
	18, 18, 18, 18, 18, 18, 18, 18, 
	18, 18, 18, 18, 18, 18, 18, 18, 
	18, 18, 18, 18, 18, 18, 18, 18, 
	18, 18, 1, 21, 1, 1, 1, 22, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 21, 1, 23, 1, 1, 1, 
	1, 1, 24, 1, 25, 1, 21, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 21, 1, 26, 
	26, 26, 26, 26, 26, 26, 26, 26, 
	1, 26, 26, 27, 26, 26, 26, 26, 
	26, 26, 26, 26, 26, 26, 26, 26, 
	26, 26, 26, 26, 26, 26, 26, 26, 
	28, 26, 26, 26, 26, 26, 26, 26, 
	26, 26, 26, 26, 26, 26, 26, 26, 
	26, 26, 26, 26, 26, 26, 26, 26, 
	26, 26, 26, 26, 26, 26, 26, 26, 
	26, 26, 26, 26, 26, 26, 26, 26, 
	26, 26, 26, 26, 26, 26, 26, 26, 
	26, 26, 26, 26, 26, 26, 26, 26, 
	26, 26, 29, 26, 26, 26, 26, 26, 
	26, 26, 26, 26, 26, 26, 26, 26, 
	26, 26, 26, 26, 26, 26, 26, 26, 
	26, 26, 26, 26, 26, 26, 26, 26, 
	26, 26, 26, 26, 26, 26, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	30, 30, 30, 30, 30, 30, 30, 30, 
	30, 30, 30, 30, 30, 30, 30, 30, 
	30, 30, 30, 30, 30, 30, 30, 30, 
	30, 30, 30, 30, 30, 30, 31, 32, 
	32, 32, 32, 32, 32, 32, 32, 32, 
	32, 32, 32, 33, 32, 32, 34, 35, 
	35, 35, 36, 1, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 1, 37, 37, 
	38, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 39, 37, 37, 
	37, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 37, 37, 40, 
	37, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 41, 41, 41, 
	41, 41, 41, 41, 41, 41, 41, 41, 
	41, 41, 41, 41, 41, 41, 41, 41, 
	41, 41, 41, 41, 41, 41, 41, 41, 
	41, 41, 41, 42, 43, 43, 43, 43, 
	43, 43, 43, 43, 43, 43, 43, 43, 
	44, 43, 43, 45, 46, 46, 46, 47, 
	1, 48, 1, 37, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 37, 1, 49, 1, 50, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 50, 1, 37, 
	37, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 37, 37, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 41, 41, 41, 41, 41, 41, 41, 
	41, 41, 41, 41, 41, 41, 41, 41, 
	41, 41, 41, 41, 41, 41, 41, 41, 
	41, 41, 41, 41, 41, 41, 41, 42, 
	43, 43, 43, 43, 43, 43, 43, 43, 
	43, 43, 43, 43, 44, 43, 43, 45, 
	46, 46, 46, 47, 1, 37, 37, 37, 
	37, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 37, 37, 37, 
	37, 37, 37, 37, 37, 1, 41, 41, 
	41, 41, 41, 41, 41, 41, 41, 41, 
	41, 41, 41, 41, 41, 41, 41, 41, 
	41, 41, 41, 41, 41, 41, 41, 41, 
	41, 41, 41, 41, 41, 41, 1, 41, 
	41, 41, 41, 41, 41, 41, 41, 41, 
	41, 41, 41, 41, 41, 41, 41, 41, 
	41, 41, 41, 41, 41, 41, 41, 41, 
	41, 41, 41, 41, 41, 41, 41, 41, 
	41, 41, 41, 41, 41, 41, 41, 41, 
	41, 41, 41, 41, 41, 41, 41, 41, 
	41, 41, 41, 41, 41, 41, 41, 41, 
	41, 41, 41, 41, 41, 41, 41, 1, 
	41, 41, 41, 41, 41, 41, 41, 41, 
	41, 41, 41, 41, 41, 41, 41, 41, 
	41, 41, 41, 41, 41, 41, 41, 41, 
	41, 41, 41, 41, 41, 41, 41, 41, 
	1, 43, 43, 43, 43, 43, 43, 43, 
	43, 43, 43, 43, 43, 43, 43, 43, 
	43, 43, 43, 43, 43, 43, 43, 43, 
	43, 43, 43, 43, 43, 43, 43, 43, 
	43, 43, 43, 43, 43, 43, 43, 43, 
	43, 43, 43, 43, 43, 43, 43, 43, 
	43, 1, 43, 43, 43, 43, 43, 43, 
	43, 43, 43, 43, 43, 43, 43, 43, 
	43, 43, 43, 43, 43, 43, 43, 43, 
	43, 43, 43, 43, 43, 43, 43, 43, 
	43, 43, 43, 43, 43, 43, 43, 43, 
	43, 43, 43, 43, 43, 43, 43, 43, 
	43, 43, 43, 43, 43, 43, 43, 43, 
	43, 43, 43, 43, 43, 43, 43, 43, 
	43, 43, 1, 43, 43, 43, 43, 43, 
	43, 43, 43, 43, 43, 43, 43, 43, 
	43, 43, 43, 1, 51, 1, 1, 1, 
	52, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 51, 1, 53, 1, 1, 
	1, 1, 1, 54, 1, 55, 1, 56, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 56, 1, 
	9, 1, 1, 1, 57, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 9, 
	58, 58, 58, 58, 58, 58, 58, 59, 
	1, 58, 58, 58, 58, 58, 1, 58, 
	58, 58, 58, 58, 58, 58, 58, 58, 
	58, 1, 1, 1, 1, 1, 1, 1, 
	58, 58, 58, 58, 58, 58, 58, 58, 
	58, 58, 58, 58, 58, 58, 58, 58, 
	58, 58, 58, 58, 58, 58, 58, 58, 
	58, 58, 1, 1, 1, 58, 58, 58, 
	58, 58, 58, 58, 58, 58, 58, 58, 
	58, 58, 58, 58, 58, 58, 58, 58, 
	58, 58, 58, 58, 58, 58, 58, 58, 
	58, 58, 58, 58, 58, 58, 1, 60, 
	60, 60, 60, 60, 60, 60, 60, 60, 
	1, 60, 60, 61, 60, 60, 60, 60, 
	60, 60, 60, 60, 60, 60, 60, 60, 
	60, 60, 60, 60, 60, 60, 60, 60, 
	60, 60, 60, 60, 60, 60, 62, 63, 
	60, 60, 60, 60, 60, 60, 60, 60, 
	60, 60, 60, 60, 60, 60, 60, 60, 
	60, 60, 60, 60, 60, 60, 60, 60, 
	60, 60, 60, 60, 60, 60, 60, 60, 
	60, 60, 60, 60, 60, 60, 60, 60, 
	60, 60, 60, 60, 60, 60, 60, 60, 
	60, 60, 64, 60, 60, 60, 60, 60, 
	60, 60, 60, 60, 60, 60, 60, 60, 
	60, 60, 60, 60, 60, 60, 60, 60, 
	60, 60, 60, 60, 60, 60, 60, 60, 
	60, 60, 60, 60, 60, 60, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	65, 65, 65, 65, 65, 65, 65, 65, 
	65, 65, 65, 65, 65, 65, 65, 65, 
	65, 65, 65, 65, 65, 65, 65, 65, 
	65, 65, 65, 65, 65, 65, 66, 67, 
	67, 67, 67, 67, 67, 67, 67, 67, 
	67, 67, 67, 68, 67, 67, 69, 70, 
	70, 70, 71, 1, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 1, 72, 72, 
	73, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 74, 75, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 76, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 77, 77, 77, 
	77, 77, 77, 77, 77, 77, 77, 77, 
	77, 77, 77, 77, 77, 77, 77, 77, 
	77, 77, 77, 77, 77, 77, 77, 77, 
	77, 77, 77, 78, 79, 79, 79, 79, 
	79, 79, 79, 79, 79, 79, 79, 79, 
	80, 79, 79, 81, 82, 82, 82, 83, 
	1, 84, 1, 72, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 72, 1, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 72, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 77, 77, 
	77, 77, 77, 77, 77, 77, 77, 77, 
	77, 77, 77, 77, 77, 77, 77, 77, 
	77, 77, 77, 77, 77, 77, 77, 77, 
	77, 77, 77, 77, 78, 79, 79, 79, 
	79, 79, 79, 79, 79, 79, 79, 79, 
	79, 80, 79, 79, 81, 82, 82, 82, 
	83, 1, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 72, 72, 72, 72, 72, 72, 
	72, 72, 1, 77, 77, 77, 77, 77, 
	77, 77, 77, 77, 77, 77, 77, 77, 
	77, 77, 77, 77, 77, 77, 77, 77, 
	77, 77, 77, 77, 77, 77, 77, 77, 
	77, 77, 77, 1, 77, 77, 77, 77, 
	77, 77, 77, 77, 77, 77, 77, 77, 
	77, 77, 77, 77, 77, 77, 77, 77, 
	77, 77, 77, 77, 77, 77, 77, 77, 
	77, 77, 77, 77, 77, 77, 77, 77, 
	77, 77, 77, 77, 77, 77, 77, 77, 
	77, 77, 77, 77, 77, 77, 77, 77, 
	77, 77, 77, 77, 77, 77, 77, 77, 
	77, 77, 77, 77, 1, 77, 77, 77, 
	77, 77, 77, 77, 77, 77, 77, 77, 
	77, 77, 77, 77, 77, 77, 77, 77, 
	77, 77, 77, 77, 77, 77, 77, 77, 
	77, 77, 77, 77, 77, 1, 79, 79, 
	79, 79, 79, 79, 79, 79, 79, 79, 
	79, 79, 79, 79, 79, 79, 79, 79, 
	79, 79, 79, 79, 79, 79, 79, 79, 
	79, 79, 79, 79, 79, 79, 79, 79, 
	79, 79, 79, 79, 79, 79, 79, 79, 
	79, 79, 79, 79, 79, 79, 1, 79, 
	79, 79, 79, 79, 79, 79, 79, 79, 
	79, 79, 79, 79, 79, 79, 79, 79, 
	79, 79, 79, 79, 79, 79, 79, 79, 
	79, 79, 79, 79, 79, 79, 79, 79, 
	79, 79, 79, 79, 79, 79, 79, 79, 
	79, 79, 79, 79, 79, 79, 79, 79, 
	79, 79, 79, 79, 79, 79, 79, 79, 
	79, 79, 79, 79, 79, 79, 79, 1, 
	79, 79, 79, 79, 79, 79, 79, 79, 
	79, 79, 79, 79, 79, 79, 79, 79, 
	1, 85, 1, 1, 1, 86, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	85, 87, 87, 87, 87, 87, 87, 87, 
	88, 1, 87, 87, 87, 87, 87, 1, 
	87, 87, 87, 87, 87, 87, 87, 87, 
	87, 87, 1, 89, 1, 1, 1, 1, 
	1, 87, 87, 87, 87, 87, 87, 87, 
	87, 87, 87, 87, 87, 87, 87, 87, 
	87, 87, 87, 87, 87, 87, 87, 87, 
	87, 87, 87, 1, 1, 1, 87, 87, 
	87, 87, 87, 87, 87, 87, 87, 87, 
	87, 87, 87, 87, 87, 87, 87, 87, 
	87, 87, 87, 87, 87, 87, 87, 87, 
	87, 87, 87, 87, 87, 87, 87, 1, 
	90, 1, 1, 1, 91, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 90, 
	1, 1, 1, 1, 1, 1, 1, 92, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 93, 1, 94, 1, 1, 1, 
	95, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 94, 1, 1, 1, 1, 
	1, 1, 1, 96, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 97, 1, 
	98, 1, 1, 1, 99, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 98, 
	100, 1, 100, 100, 100, 100, 100, 101, 
	1, 100, 100, 100, 100, 100, 1, 100, 
	100, 100, 100, 100, 100, 100, 100, 100, 
	100, 1, 93, 1, 100, 1, 1, 1, 
	100, 100, 100, 100, 100, 100, 100, 100, 
	100, 100, 100, 100, 100, 100, 100, 100, 
	100, 100, 100, 100, 100, 100, 100, 100, 
	100, 100, 1, 1, 1, 100, 100, 100, 
	100, 100, 100, 100, 100, 100, 100, 100, 
	100, 100, 100, 100, 100, 100, 100, 100, 
	100, 100, 100, 100, 100, 100, 100, 100, 
	100, 100, 100, 100, 100, 100, 1, 56, 
	1, 1, 1, 102, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 56, 1, 
	1, 1, 1, 1, 1, 1, 103, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 4, 1, 104, 1, 1, 1, 105, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 104, 1, 1, 1, 1, 1, 
	1, 1, 106, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 9, 1, 107, 
	1, 1, 1, 108, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 107, 109, 
	109, 109, 109, 109, 109, 109, 110, 1, 
	109, 109, 109, 109, 109, 1, 109, 109, 
	109, 109, 109, 109, 109, 109, 109, 109, 
	1, 111, 1, 1, 1, 1, 1, 109, 
	109, 109, 109, 109, 109, 109, 109, 109, 
	109, 109, 109, 109, 109, 109, 109, 109, 
	109, 109, 109, 109, 109, 109, 109, 109, 
	109, 1, 1, 1, 109, 109, 109, 109, 
	109, 109, 109, 109, 109, 109, 109, 109, 
	109, 109, 109, 109, 109, 109, 109, 109, 
	109, 109, 109, 109, 109, 109, 109, 109, 
	109, 109, 109, 109, 109, 1, 1, 0
]

class << self
	attr_accessor :_content_disposition_trans_targs
	private :_content_disposition_trans_targs, :_content_disposition_trans_targs=
end
self._content_disposition_trans_targs = [
	1, 0, 2, 4, 5, 3, 1, 2, 
	4, 5, 6, 8, 30, 7, 8, 9, 
	10, 11, 46, 13, 27, 10, 11, 13, 
	27, 12, 14, 15, 44, 19, 20, 21, 
	22, 23, 24, 25, 26, 14, 15, 44, 
	19, 20, 21, 22, 23, 24, 25, 26, 
	16, 18, 44, 10, 11, 13, 27, 29, 
	47, 6, 8, 30, 32, 33, 32, 50, 
	35, 36, 37, 38, 39, 40, 41, 42, 
	32, 33, 32, 50, 35, 36, 37, 38, 
	39, 40, 41, 42, 34, 1, 2, 49, 
	4, 5, 44, 17, 45, 5, 44, 17, 
	45, 5, 47, 28, 46, 48, 28, 48, 
	47, 28, 48, 1, 2, 49, 4, 5
]

class << self
	attr_accessor :_content_disposition_trans_actions
	private :_content_disposition_trans_actions, :_content_disposition_trans_actions=
end
self._content_disposition_trans_actions = [
	0, 0, 0, 1, 0, 0, 2, 2, 
	3, 2, 0, 4, 1, 0, 0, 5, 
	6, 6, 6, 6, 7, 0, 0, 0, 
	1, 0, 8, 8, 9, 8, 8, 8, 
	8, 8, 8, 8, 8, 0, 0, 10, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 2, 2, 2, 3, 0, 
	0, 2, 11, 3, 12, 12, 13, 14, 
	12, 12, 12, 12, 12, 12, 12, 12, 
	0, 0, 1, 15, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 16, 16, 17, 
	18, 16, 19, 19, 20, 19, 21, 21, 
	22, 21, 19, 19, 0, 23, 0, 1, 
	2, 2, 3, 24, 24, 0, 25, 24
]

class << self
	attr_accessor :_content_disposition_eof_actions
	private :_content_disposition_eof_actions, :_content_disposition_eof_actions=
end
self._content_disposition_eof_actions = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 16, 19, 21, 19, 0, 
	2, 24, 0
]

class << self
	attr_accessor :content_disposition_start
end
self.content_disposition_start = 43;
class << self
	attr_accessor :content_disposition_first_final
end
self.content_disposition_first_final = 43;
class << self
	attr_accessor :content_disposition_error
end
self.content_disposition_error = 0;

class << self
	attr_accessor :content_disposition_en_comment_tail
end
self.content_disposition_en_comment_tail = 31;
class << self
	attr_accessor :content_disposition_en_main
end
self.content_disposition_en_main = 43;


# line 18 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/content_disposition_machine.rb.rl"

        def self.parse(data)
          p = 0
          stack = []

          actions = []
          data = Utilities::ParseBuffer.new( data )
          eof = data.length
          
# line 603 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/content_disposition_machine.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = content_disposition_start
	top = 0
end

# line 27 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/content_disposition_machine.rb.rl"
          
# line 613 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/content_disposition_machine.rb"
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
	_inds = _content_disposition_index_offsets[cs]
	_slen = _content_disposition_key_spans[cs]
	_trans = if (   _slen > 0 && 
			_content_disposition_trans_keys[_keys] <= ( data.at(p)) && 
			( data.at(p)) <= _content_disposition_trans_keys[_keys + 1] 
		    ) then
			_content_disposition_indicies[ _inds + ( data.at(p)) - _content_disposition_trans_keys[_keys] ] 
		 else 
			_content_disposition_indicies[ _inds + _slen ]
		 end
	cs = _content_disposition_trans_targs[_trans]
	if _content_disposition_trans_actions[_trans] != 0
	case _content_disposition_trans_actions[_trans]
	when 2 then
# line 7 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/rb_actions.rl"
		begin
 actions.push(4, p) 		end
	when 12 then
# line 8 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/rb_actions.rl"
		begin
 actions.push(5, p) 		end
	when 24 then
# line 13 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/rb_actions.rl"
		begin
 actions.push(10, p) 		end
	when 17 then
# line 14 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/rb_actions.rl"
		begin
 actions.push(11, p) 		end
	when 5 then
# line 35 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/rb_actions.rl"
		begin
 actions.push(32, p) 		end
	when 4 then
# line 36 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/rb_actions.rl"
		begin
 actions.push(33, p) 		end
	when 19 then
# line 37 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/rb_actions.rl"
		begin
 actions.push(34, p) 		end
	when 6 then
# line 38 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/rb_actions.rl"
		begin
 actions.push(35, p) 		end
	when 10 then
# line 41 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/rb_actions.rl"
		begin
 actions.push(38, p) 		end
	when 8 then
# line 42 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/rb_actions.rl"
		begin
 actions.push(39, p) 		end
	when 1 then
# line 5 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/../../common.rl"
		begin
 	begin
		stack[top] = cs
		top+= 1
		cs = 31
		_goto_level = _again
		next
	end
 		end
	when 15 then
# line 6 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/../../common.rl"
		begin
 	begin
		top -= 1
		cs = stack[top]
		_goto_level = _again
		next
	end
 		end
	when 11 then
# line 7 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/rb_actions.rl"
		begin
 actions.push(4, p) 		end
# line 36 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/rb_actions.rl"
		begin
 actions.push(33, p) 		end
	when 21 then
# line 7 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/rb_actions.rl"
		begin
 actions.push(4, p) 		end
# line 37 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/rb_actions.rl"
		begin
 actions.push(34, p) 		end
	when 3 then
# line 7 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/rb_actions.rl"
		begin
 actions.push(4, p) 		end
# line 5 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/../../common.rl"
		begin
 	begin
		stack[top] = cs
		top+= 1
		cs = 31
		_goto_level = _again
		next
	end
 		end
	when 13 then
# line 8 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/rb_actions.rl"
		begin
 actions.push(5, p) 		end
# line 5 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/../../common.rl"
		begin
 	begin
		stack[top] = cs
		top+= 1
		cs = 31
		_goto_level = _again
		next
	end
 		end
	when 14 then
# line 8 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/rb_actions.rl"
		begin
 actions.push(5, p) 		end
# line 6 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/../../common.rl"
		begin
 	begin
		top -= 1
		cs = stack[top]
		_goto_level = _again
		next
	end
 		end
	when 25 then
# line 13 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/rb_actions.rl"
		begin
 actions.push(10, p) 		end
# line 5 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/../../common.rl"
		begin
 	begin
		stack[top] = cs
		top+= 1
		cs = 31
		_goto_level = _again
		next
	end
 		end
	when 16 then
# line 14 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/rb_actions.rl"
		begin
 actions.push(11, p) 		end
# line 13 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/rb_actions.rl"
		begin
 actions.push(10, p) 		end
	when 23 then
# line 37 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/rb_actions.rl"
		begin
 actions.push(34, p) 		end
# line 5 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/../../common.rl"
		begin
 	begin
		stack[top] = cs
		top+= 1
		cs = 31
		_goto_level = _again
		next
	end
 		end
	when 7 then
# line 38 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/rb_actions.rl"
		begin
 actions.push(35, p) 		end
# line 5 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/../../common.rl"
		begin
 	begin
		stack[top] = cs
		top+= 1
		cs = 31
		_goto_level = _again
		next
	end
 		end
	when 9 then
# line 42 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/rb_actions.rl"
		begin
 actions.push(39, p) 		end
# line 41 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/rb_actions.rl"
		begin
 actions.push(38, p) 		end
	when 20 then
# line 5 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/../../common.rl"
		begin
 	begin
		stack[top] = cs
		top+= 1
		cs = 31
		_goto_level = _again
		next
	end
 		end
# line 37 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/rb_actions.rl"
		begin
 actions.push(34, p) 		end
	when 22 then
# line 7 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/rb_actions.rl"
		begin
 actions.push(4, p) 		end
# line 5 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/../../common.rl"
		begin
 	begin
		stack[top] = cs
		top+= 1
		cs = 31
		_goto_level = _again
		next
	end
 		end
# line 37 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/rb_actions.rl"
		begin
 actions.push(34, p) 		end
	when 18 then
# line 14 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/rb_actions.rl"
		begin
 actions.push(11, p) 		end
# line 13 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/rb_actions.rl"
		begin
 actions.push(10, p) 		end
# line 5 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/../../common.rl"
		begin
 	begin
		stack[top] = cs
		top+= 1
		cs = 31
		_goto_level = _again
		next
	end
 		end
# line 869 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/content_disposition_machine.rb"
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
	  case _content_disposition_eof_actions[cs]
	when 2 then
# line 7 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/rb_actions.rl"
		begin
 actions.push(4, p) 		end
	when 24 then
# line 13 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/rb_actions.rl"
		begin
 actions.push(10, p) 		end
	when 19 then
# line 37 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/rb_actions.rl"
		begin
 actions.push(34, p) 		end
	when 21 then
# line 7 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/rb_actions.rl"
		begin
 actions.push(4, p) 		end
# line 37 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/rb_actions.rl"
		begin
 actions.push(34, p) 		end
	when 16 then
# line 14 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/rb_actions.rl"
		begin
 actions.push(11, p) 		end
# line 13 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/rb_actions.rl"
		begin
 actions.push(10, p) 		end
# line 913 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/content_disposition_machine.rb"
	  end
	end

	end
	if _goto_level <= _out
		break
	end
end
	end

# line 28 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/content_disposition_machine.rb.rl"

          if p == eof && cs >= 
# line 927 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/content_disposition_machine.rb"
43
# line 29 "/Users/peter/src/mail/lib/mail/parsers/ragel/ruby/machines/content_disposition_machine.rb.rl"

            return actions, nil
          else
            return [], "Only able to parse up to #{data[0..p]}/#{p} but should have gotten to #{eof}"
          end
        end
      end
    end
  end
end
