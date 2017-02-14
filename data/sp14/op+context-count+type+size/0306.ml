
let rec digitalRoot n =
  if n = 0
  then 0
  else
    (let rec r_digitalRoot n m =
       if n <= 9 then n else r_digitalRoot (n / 10) ((n mod 10) + m) in
     match n with | 0 -> r_digitalRoot | _ -> r_digitalRoot n (n mod 10));;


(* fix

let rec digitalRoot n =
  if n = 0
  then 0
  else
    (let rec r_digitalRoot n m =
       if n <= 9 then n else r_digitalRoot (n / 10) ((n mod 10) + m) in
     match n with | 0 -> 0 | _ -> r_digitalRoot n 0);;

*)

(* changed spans
(8,26)-(8,39)
(8,64)-(8,65)
(8,64)-(8,72)
(8,70)-(8,72)
*)

(* type error slice
(3,3)-(8,72)
(3,3)-(8,72)
(4,8)-(4,9)
(6,6)-(8,72)
(7,30)-(7,43)
(7,30)-(7,68)
(8,6)-(8,72)
(8,6)-(8,72)
(8,26)-(8,39)
(8,47)-(8,60)
(8,47)-(8,72)
*)
