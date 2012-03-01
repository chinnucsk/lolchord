-module(lolchord_math).

-export ([key_for/1, key_bits/0, key_in_interval/2]).

key_for(Data) ->
  ZStream = zlib:open(),
  Key     = zlib:crc32(ZStream, Data),
  ok      = zlib:close(ZStream),
  Key.

key_bits() -> 32.

maximum_key() ->
  trunc(math:pow(2, key_bits())).
  
number_mod_max(Num) -> 
  trunc(Num) rem maximum_key().

interval_mod_max({Start, End}) -> 
  {number_mod_max(Start), number_mod_max(End)}.

key_in_interval(Interval, Key) ->
  Ranges = interval_to_ranges(interval_mod_max(Interval)),
  ranges_contain_key(Ranges, number_mod_max(Key)).

interval_to_ranges({Start, End}) when End < Start ->
  [{0, End}, {Start, maximum_key()}];
interval_to_ranges({Start, End})  ->
  [{Start, End}].

ranges_contain_key(Ranges, Key) ->
  lists:any(fun
    ({Start, End}) when (Start =< Key) and (Key < End) ->
      true;
    (_) ->
      false
  end, Ranges).
