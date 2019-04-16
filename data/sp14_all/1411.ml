
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
(8,37)-(8,58)
r_digitalRoot n (-1)
AppG (fromList [VarG,LitG])

*)

(* type error slice
(7,30)-(7,43)
(7,30)-(7,69)
(8,37)-(8,54)
(8,37)-(8,58)
(8,38)-(8,51)
*)
