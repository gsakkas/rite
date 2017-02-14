
let rec digitalRoot n =
  if n <= 9
  then n
  else
    (let rec r_digitalRoot n m =
       if n <= 9 then n else r_digitalRoot (n / 10) ((n mod 10) + m) in
     match n with | 0 -> 123 | _ -> (r_digitalRoot n) - 1);;


(* fix

let rec digitalRoot n =
  if n <= 9
  then n
  else
    (let rec r_digitalRoot n m =
       if n <= 9 then n else r_digitalRoot (n / 10) ((n mod 10) + m) in
     match n with | 0 -> 123 | _ -> r_digitalRoot n (-1));;

*)

(* changed spans
(8,38)-(8,53)
(8,38)-(8,58)
(8,57)-(8,58)
*)

(* type error slice
(7,30)-(7,43)
(7,30)-(7,68)
(8,38)-(8,51)
(8,38)-(8,53)
(8,38)-(8,58)
*)
