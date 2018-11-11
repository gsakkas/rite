
let rec listReverse l =
  match l with | [] -> l | h::t -> listReverse (h :: l) t;;


(* fix

let rec listReverse l = match l with | [] -> l | h::t -> listReverse (h :: l);;

*)

(* changed spans
(3,35)-(3,57)
listReverse (h :: l)
AppG [ConAppG (Just (TupleG [VarG,VarG])) Nothing]

*)
