
let rec listReverse l =
  match l with | [] -> [] | h::t -> h :: (l listReverse t);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [];;

*)

(* changed spans
(3,42)-(3,43)
(@)
VarG

(3,44)-(3,55)
listReverse t
AppG (fromList [VarG])

*)
