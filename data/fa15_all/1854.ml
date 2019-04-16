
let rec listReverse l = match l with | [] -> [] | h::t -> t @ h;;


(* fix

let rec listReverse l = match l with | [] -> [] | h::t -> t @ [h];;

*)

(* changed spans
(2,63)-(2,64)
[h]
ListG (fromList [VarG])

*)

(* type error slice
(2,25)-(2,64)
(2,59)-(2,60)
(2,59)-(2,64)
(2,61)-(2,62)
(2,63)-(2,64)
*)
