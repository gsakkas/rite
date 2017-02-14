
let rec digitsOfInt n =
  if n < 0
  then []
  else (fun n  -> let d = digitsOfInt (n / 10) in (n mod 10) :: d);;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (let d = digitsOfInt (n / 10) in (n mod 10) :: d);;

*)

(* changed spans
(5,9)-(5,66)
(5,19)-(5,66)
*)

(* type error slice
(3,3)-(5,66)
(3,3)-(5,66)
(4,8)-(4,10)
(5,9)-(5,66)
*)
