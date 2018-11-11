
let rec listReverse l =
  match l with | [] -> [] | hd::tl -> (listReverse tl) :: hd;;


(* fix

let rec listReverse l = match l with | [] -> [] | _::tl -> listReverse tl;;

*)

(* changed spans
(3,2)-(3,60)
match l with
| [] -> []
| _ :: tl -> listReverse tl
CaseG VarG [(Nothing,ListG EmptyG Nothing),(Nothing,AppG [EmptyG])]

*)
