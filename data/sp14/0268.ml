
let rec digitsOfInt n =
  let myList = [] in
  if n <= 0 then [] else [digitsOfInt (n mod 10); digitsOfInt (n / 10)];;


(* fix

let rec digitsOfInt n =
  let myList = [] in
  if n <= 0
  then []
  else if n < 10 then [n] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(4,26)-(4,72)
if n < 10
then [n]
else digitsOfInt (n / 10) @ [n mod 10]
IteG (BopG EmptyG EmptyG) (ListG [EmptyG]) (AppG [EmptyG,EmptyG])

*)

(* type error slice
(2,4)-(4,74)
(2,21)-(4,72)
(3,3)-(4,72)
(4,3)-(4,72)
(4,26)-(4,72)
(4,51)-(4,62)
(4,51)-(4,71)
*)
