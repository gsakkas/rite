
let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec listReverse l = match l with | [] -> [] | h::t -> cat listReverse t h;;


(* fix

let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> cat (listReverse t) h;;

*)

(* changed spans
(4,59)-(4,78)
cat (listReverse t) h
AppG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* type error slice
(2,54)-(2,68)
(2,59)-(2,68)
(2,60)-(2,63)
(4,59)-(4,62)
(4,59)-(4,78)
*)
