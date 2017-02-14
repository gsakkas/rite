
let rec add current next =
  match current with | [] -> [next] | front::back -> front (add back next);;

let rec digitsOfInt n =
  if n <= 0 then [] else digitsOfInt (n / 10) add [n mod 10];;


(* fix

let rec add current next =
  match current with | [] -> [next] | front::back -> front :: (add back next);;

let rec digitsOfInt n =
  if n <= 0 then [] else add (digitsOfInt (n / 10)) (n mod 10);;

*)

(* changed spans
(3,53)-(3,74)
(6,25)-(6,36)
(6,25)-(6,60)
(6,46)-(6,49)
(6,50)-(6,60)
*)

(* type error slice
(5,3)-(6,62)
(5,20)-(6,60)
(6,2)-(6,60)
(6,25)-(6,36)
(6,25)-(6,60)
*)
