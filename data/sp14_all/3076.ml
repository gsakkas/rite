
let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> cat l (listReverse t h);;


(* fix

let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> cat (listReverse t) h;;

*)

(* changed spans
(5,42)-(5,59)
listReverse t
AppG (fromList [VarG])

*)
