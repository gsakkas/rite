
let rec digitalRoot n =
  if n = 0
  then 0
  else
    (let rec r_digitalRoot n m =
       if n <= 9 then n else r_digitalRoot (n / 10) ((n mod 10) + m) in
     match n with | 0 -> r_digitalRoot | _ -> r_digitalRoot n (n mod 10));;
