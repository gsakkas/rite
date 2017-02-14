
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
(3,53)-(3,74)
(6,25)-(6,62)
(6,37)-(6,62)
(6,47)-(6,50)
(6,51)-(6,61)
*)

(* type error slice
(6,37)-(6,62)
(6,38)-(6,46)
*)
