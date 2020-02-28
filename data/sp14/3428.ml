
let rec listReverse l =
  match l with | [] -> [] | x::l -> x :: (listReverse l x);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | x::l -> x :: (listReverse l);;

*)

(* changed spans
(3,42)-(3,59)
listReverse l
AppG [VarG]

*)

(* type error slice
(2,4)-(3,61)
(2,21)-(3,59)
(3,3)-(3,59)
(3,37)-(3,59)
(3,42)-(3,59)
(3,43)-(3,54)
*)
