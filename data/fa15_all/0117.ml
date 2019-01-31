
let rec listReverse l =
  match l with | [] -> [] | h -> h | h::t -> t :: (listReverse [h]);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h -> h | h::t -> t @ (listReverse [h]);;

*)

(* changed spans
(3,45)-(3,46)
(@)
VarG

(3,45)-(3,67)
t @ listReverse [h]
AppG (fromList [VarG,AppG (fromList [EmptyG])])

*)
