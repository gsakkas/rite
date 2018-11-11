
let rec listReverse l = match l with | [] -> [] | h::t -> [(listReverse t) h];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t; [h]);;

*)

(* changed spans
(2,59)-(2,76)
listReverse t; [h]
SeqG (AppG [EmptyG]) (ListG EmptyG Nothing)

(2,75)-(2,76)
[h]
ListG VarG Nothing

*)
