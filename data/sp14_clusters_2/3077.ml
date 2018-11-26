
let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec listReverse l = match l with | [] -> [] | h::t -> cat listReverse t h;;


(* fix

let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> cat (listReverse t) h;;

*)

(* changed spans
(4,58)-(4,77)
cat (listReverse t) h
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(4,62)-(4,73)
listReverse t
AppG (fromList [VarG])

*)
