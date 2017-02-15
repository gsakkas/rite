
let rec add current next =
  match current with | [] -> [next] | front::back -> front (add back next);;

let rec digitsOfInt n =
  if n <= 0 then [] else add (digitsOfInt (n / 10)) [n mod 10];;


(* fix

let rec add current next =
  match current with | [] -> [next] | front::back -> front :: (add back next);;

let rec digitsOfInt n =
  if n <= 0 then [] else add (digitsOfInt (n / 10)) (n mod 10);;

*)

(* changed spans
(3,53)-(3,74)
(6,52)-(6,62)
*)

(* type error slice
(3,2)-(3,74)
(3,2)-(3,74)
(3,53)-(3,58)
(3,53)-(3,74)
(3,59)-(3,74)
(3,60)-(3,63)
(3,64)-(3,68)
(5,3)-(6,64)
(5,20)-(6,62)
(6,2)-(6,62)
(6,25)-(6,28)
(6,25)-(6,62)
(6,29)-(6,51)
(6,30)-(6,41)
*)
