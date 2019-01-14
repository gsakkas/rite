
let rec listReverse l =
  match l with | [] -> [] | hd::l' -> 1 + (listReverse l);;


(* fix

let rec listReverse l = match l with | [] -> [] | _::tl -> listReverse tl;;

*)

(* changed spans
(3,2)-(3,57)
match l with
| [] -> []
| _ :: tl -> listReverse tl
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG Nothing)])

(3,55)-(3,56)
tl
VarG

*)
