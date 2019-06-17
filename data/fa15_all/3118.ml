
let rec listReverse l = match l with | [] -> [] | a::l' -> listReverse @ [a];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | a::l' -> (listReverse l') @ [a];;

*)

(* changed spans
(2,60)-(2,71)
listReverse l'
AppG [VarG]

*)

(* type error slice
(2,4)-(2,79)
(2,21)-(2,77)
(2,60)-(2,71)
(2,60)-(2,77)
(2,72)-(2,73)
*)
