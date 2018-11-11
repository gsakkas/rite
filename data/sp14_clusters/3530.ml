
let rec listReverse l =
  match l with | 0 -> [] | _::tl -> (listReverse tl) + tl;;


(* fix

let rec listReverse l = match l with | [] -> [] | _::tl -> listReverse tl;;

*)

(* changed spans
(3,2)-(3,57)
match l with
| [] -> []
| _ :: tl -> listReverse tl
CaseG VarG [(Nothing,ListG EmptyG Nothing),(Nothing,AppG [EmptyG])]

*)
