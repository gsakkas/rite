
let rec digitsOfInt n = if n > 0 then (n / 10) :: (n mod 10) else [];;


(* fix

let rec digitsOfInt n = if n > 0 then [n / 10; n mod 10] else [];;

*)

(* changed spans
(2,40)-(2,60)
*)

(* type error slice
(2,40)-(2,60)
(2,52)-(2,60)
*)
