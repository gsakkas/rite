
let rec listReverse l = match l with | [] -> [] | a::l' -> listReverse @ a;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | a::l' -> (listReverse l') @ [a];;

*)

(* changed spans
(2,60)-(2,71)
listReverse l'
AppG [VarG]

(2,74)-(2,75)
[a]
ListG [VarG]

*)

(* type error slice
(2,4)-(2,77)
(2,21)-(2,75)
(2,60)-(2,71)
(2,60)-(2,75)
(2,72)-(2,73)
*)
