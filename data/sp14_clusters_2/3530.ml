
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
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG Nothing)])

*)
