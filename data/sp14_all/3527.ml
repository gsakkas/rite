
let rec listReverse l =
  match l with | [] -> [] | hd::l' -> 1 + (listReverse l);;


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
(2,4)-(3,60)
(2,21)-(3,58)
(3,3)-(3,58)
(3,24)-(3,26)
(3,39)-(3,58)
(3,43)-(3,58)
(3,44)-(3,55)
*)
