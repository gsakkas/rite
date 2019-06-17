
let rec listReverse l = match l with | [] -> [] | h::t -> [listReverse t] @ h;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

*)

(* changed spans
(2,59)-(2,74)
listReverse t
AppG [VarG]

(2,77)-(2,78)
[h]
ListG [VarG]

*)

(* type error slice
(2,4)-(2,80)
(2,21)-(2,78)
(2,25)-(2,78)
(2,59)-(2,74)
(2,59)-(2,78)
(2,60)-(2,71)
(2,60)-(2,73)
(2,75)-(2,76)
*)
