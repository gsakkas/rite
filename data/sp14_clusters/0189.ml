
let rec last l =
  match l with | x::[] -> x | hd::tl -> last tl | [] -> failwith "NO ELEMENT";;

let rec listReverse l = match l with | [] -> [] | hd::tl -> (last tl) :: hd;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | hd::tl -> listReverse (hd :: l);;

*)

(* changed spans
(5,66)-(5,68)
listReverse
VarG

(5,73)-(5,75)
hd :: l
ConAppG (Just (TupleG [VarG,VarG])) Nothing

*)
