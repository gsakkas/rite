
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
0
LitG

(8,63)-(8,73)
0
LitG

*)

(* type error slice
(3,3)-(8,74)
(4,8)-(4,9)
(6,5)-(8,74)
(7,30)-(7,43)
(7,30)-(7,69)
(8,6)-(8,73)
(8,26)-(8,39)
(8,47)-(8,60)
(8,47)-(8,73)
*)
