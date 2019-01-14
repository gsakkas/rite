
let rec listReverse l = match l with | [] -> [] | a::l' -> listReverse @ [a];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | a::l' -> (listReverse l') @ [a];;

*)

(* changed spans
(2,59)-(2,70)
listReverse l'
AppG (fromList [VarG])

(2,73)-(2,76)
l'
VarG

*)
