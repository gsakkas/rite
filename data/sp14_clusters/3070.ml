
let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec listReverse l = match l with | [] -> [] | h::t -> (cat t l) :: h;;


(* fix

let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> listReverse (cat l h);;

*)

(* changed spans
(4,58)-(4,67)
listReverse
VarG

(4,58)-(4,72)
listReverse (cat l h)
AppG [AppG [EmptyG,EmptyG]]

*)
