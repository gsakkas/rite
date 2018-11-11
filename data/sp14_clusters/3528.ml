
let rec listReverse l =
  match l with | [] -> [] | hd::l' -> 1 + (listReverse l');;


(* fix

let rec listReverse l = match l with | [] -> [] | _::tl -> listReverse tl;;

*)

(* changed spans
(3,2)-(3,58)
match l with
| [] -> []
| _ :: tl -> listReverse tl
CaseG VarG [(Nothing,ListG EmptyG Nothing),(Nothing,AppG [EmptyG])]

(3,55)-(3,57)
tl
VarG

*)
