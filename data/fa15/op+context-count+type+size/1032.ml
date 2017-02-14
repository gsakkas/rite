
let rec add current next =
  match current with | [] -> [next] | front::back -> front (add back next);;

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) add [n mod 10];;


(* fix

let rec add current next =
  match current with | [] -> [next] | front::back -> front :: (add back next);;

let rec digitsOfInt n =
  if n <= 0 then [] else add (digitsOfInt (n / 10)) (n mod 10);;

*)

(* changed spans
(3,54)-(3,74)
(6,27)-(6,46)
(6,49)-(6,52)
(6,53)-(6,63)
*)

(* type error slice
(5,4)-(6,65)
(5,21)-(6,63)
(6,3)-(6,63)
(6,27)-(6,38)
(6,27)-(6,46)
(6,27)-(6,63)
*)
