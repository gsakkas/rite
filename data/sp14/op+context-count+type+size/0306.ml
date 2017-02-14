
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
(8,25)-(8,38)
(8,62)-(8,72)
(8,63)-(8,64)
(8,69)-(8,71)
*)

(* type error slice
(3,2)-(8,73)
(3,2)-(8,73)
(4,7)-(4,8)
(6,4)-(8,73)
(7,29)-(7,42)
(7,29)-(7,68)
(8,5)-(8,72)
(8,5)-(8,72)
(8,25)-(8,38)
(8,46)-(8,59)
(8,46)-(8,72)
*)
