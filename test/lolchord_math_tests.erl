-module (lolchord_math_tests).
-include_lib("eunit/include/eunit.hrl").

key_bits_test() -> ?assert(lolchord_math:key_bits() =:= 32).
% perhaps I could generate tests here. Meh
simple_interval_test() -> ?assert(lolchord_math:key_in_interval({1,4},3)).
simple_edgecase_interval_test() -> ?assert(lolchord_math:key_in_interval({1,4},1)).

complex_interval_test() -> ?assert(lolchord_math:key_in_interval({4,1},8)).
complex_edgecase_interval1_test() -> ?assert(lolchord_math:key_in_interval({4,1},4)).
complex_edgecase_interval2_test() -> ?assert(lolchord_math:key_in_interval({4,1},0)).
complex_edgecase_interval3_test() -> ?assert(lolchord_math:key_in_interval({4,1}, math:pow(2, lolchord_math:key_bits()) - 1)).
complex_edgecase_interval4_test() -> ?assert(lolchord_math:key_in_interval({4,1}, math:pow(2, lolchord_math:key_bits()))).


