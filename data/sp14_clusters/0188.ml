
let rec listReverse l =
  match l with
  | [] -> []
  | hd::tl -> if hd != [] then (listReverse tl) :: hd else hd;;


(* fix

let rec listReverse l = match l with | [] -> [] | _::tl -> listReverse tl;;

*)

(* changed spans
(3,2)-(5,61)
match l with
| [] -> []
| _ :: tl -> listReverse tl
CaseG VarG [(Nothing,ListG EmptyG Nothing),(Nothing,AppG [EmptyG])]

*)
