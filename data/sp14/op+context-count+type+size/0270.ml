
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
(8,36)-(8,53)
(8,36)-(8,57)
(8,56)-(8,57)
*)

(* type error slice
(7,29)-(7,42)
(7,29)-(7,68)
(8,36)-(8,53)
(8,36)-(8,57)
(8,37)-(8,50)
*)
