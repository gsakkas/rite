
let rec add current next =
  match current with | [] -> [next] | front::back -> front (add back next);;

let rec digitsOfInt n =
  if n <= 0 then [] else digitsOfInt ((n / 10) add [n mod 10]);;


(* fix

let rec add current next =
  match current with | [] -> [next] | front::back -> front :: (add back next);;

let rec digitsOfInt n =
  if n <= 0 then [] else add (digitsOfInt (n / 10)) (n mod 10);;

*)

(* changed spans
(3,54)-(3,74)
(6,26)-(6,62)
(6,40)-(6,62)
(6,48)-(6,51)
(6,52)-(6,62)
*)

(* type error slice
(6,40)-(6,46)
(6,40)-(6,62)
*)
