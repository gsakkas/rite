
let rec listReverse l =
  match l with | [] -> [] | h::t -> h :: (l listReverse t);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> h :: (listReverse t);;

*)

(* changed spans
(3,42)-(3,59)
listReverse t
AppG [VarG]

*)

(* type error slice
(3,3)-(3,59)
(3,9)-(3,10)
(3,42)-(3,59)
(3,43)-(3,44)
*)
