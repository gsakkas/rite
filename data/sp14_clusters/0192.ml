
let rec listReverse l =
  match l with | [] -> [] | hd::tl -> listReverse (hd :: l) tl;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | hd::tl -> listReverse (hd :: l);;

*)

(* changed spans
(3,38)-(3,62)
listReverse (hd :: l)
AppG [ConAppG (Just (TupleG [VarG,VarG])) Nothing]

*)
