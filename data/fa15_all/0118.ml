
let rec listReverse l =
  match l with | [] -> [] | h -> [h] | h::t -> h :: (listReverse [t]);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h -> h | h::t -> t @ (listReverse [h]);;

*)

(* changed spans
(3,47)-(3,48)
t @ listReverse [h]
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(3,52)-(3,69)
t
VarG

(3,52)-(3,69)
(@)
VarG

(3,66)-(3,67)
h
VarG

*)
