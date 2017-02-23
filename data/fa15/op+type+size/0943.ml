
let rec add current next =
  match current with | [] -> [next] | front::back -> front (add back next);;

let rec digitsOfInt n =
  if n <= 0 then [] else add (digitsOfInt (n / 10)) (n mod 10);;


(* fix

let rec add current next =
  match current with | [] -> [next] | front::back -> front :: (add back next);;

let rec digitsOfInt n =
  if n <= 0 then [] else add (digitsOfInt (n / 10)) (n mod 10);;

*)

(* changed spans
(3,53)-(3,74)
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

(* all spans
(2,12)-(3,74)
(2,20)-(3,74)
(3,2)-(3,74)
(3,8)-(3,15)
(3,29)-(3,35)
(3,30)-(3,34)
(3,53)-(3,74)
(3,53)-(3,58)
(3,59)-(3,74)
(3,60)-(3,63)
(3,64)-(3,68)
(3,69)-(3,73)
(5,20)-(6,62)
(6,2)-(6,62)
(6,5)-(6,11)
(6,5)-(6,6)
(6,10)-(6,11)
(6,17)-(6,19)
(6,25)-(6,62)
(6,25)-(6,28)
(6,29)-(6,51)
(6,30)-(6,41)
(6,42)-(6,50)
(6,43)-(6,44)
(6,47)-(6,49)
(6,52)-(6,62)
(6,53)-(6,54)
(6,59)-(6,61)
*)
