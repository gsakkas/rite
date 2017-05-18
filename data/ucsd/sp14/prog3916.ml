
let rec intlist x =
  if x < 10 then [x] else (intlist (x / 10)) @ ([x mod 10] intlist 10);;
