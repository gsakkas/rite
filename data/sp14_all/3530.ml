
let rec listReverse l =
  match l with | 0 -> [] | _::tl -> (listReverse tl) + tl;;


(* fix

let rec listReverse l = match l with | [] -> [] | _::tl -> listReverse tl;;

*)

(* changed spans
(3,3)-(3,58)
match l with
| [] -> []
| _ :: tl -> listReverse tl
CaseG VarG (fromList [(ConsPatG WildPatG VarPatG,Nothing,AppG (fromList [EmptyG])),(ConPatG Nothing,Nothing,ListG (fromList []))])

*)

(* type error slice
(3,3)-(3,58)
(3,23)-(3,25)
(3,37)-(3,58)
(3,56)-(3,58)
*)
