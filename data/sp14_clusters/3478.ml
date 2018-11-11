
let rec listReverse l = match l with | [] -> [] | h::t -> [listReverse t h];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t; [h]);;

*)

(* changed spans
(2,59)-(2,70)
listReverse t
AppG [VarG]

(2,59)-(2,74)
listReverse t; [h]
SeqG (AppG [EmptyG]) (ListG EmptyG Nothing)

(2,73)-(2,74)
[h]
ListG VarG Nothing

*)
