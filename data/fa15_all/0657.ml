
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
(3,54)-(3,75)
front :: (add back next)
AppG [VarG,AppG [EmptyG,EmptyG]]

(6,26)-(6,63)
add (digitsOfInt (n / 10))
    (n mod 10)
AppG [AppG [EmptyG],BopG EmptyG EmptyG]

*)

(* type error slice
(5,4)-(6,65)
(5,21)-(6,63)
(6,3)-(6,63)
(6,26)-(6,48)
(6,26)-(6,63)
(6,27)-(6,38)
*)
