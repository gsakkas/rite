
let rec listReverse l = match l with | h::t -> listReverse h | [] -> [];;


(* fix

let rec listReverse l = match l with | h::t -> listReverse [h] | [] -> [];;

*)

(* changed spans
(2,60)-(2,61)
[h]
ListG (fromList [VarG])

*)

(* type error slice
(2,4)-(2,74)
(2,21)-(2,72)
(2,25)-(2,72)
(2,31)-(2,32)
(2,48)-(2,59)
(2,48)-(2,61)
(2,60)-(2,61)
*)
