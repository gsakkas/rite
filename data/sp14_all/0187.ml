
let rec listReverse l =
  match l with | [] -> [] | hd::tl -> (listReverse tl) :: hd;;


(* fix

let rec listReverse l = match l with | [] -> [] | _::tl -> listReverse tl;;

*)

(* changed spans
(3,3)-(3,61)
match l with
| [] -> []
| _ :: tl -> listReverse tl
CaseG VarG (fromList [(ConsPatG WildPatG VarPatG,Nothing,AppG (fromList [EmptyG])),(ConPatG Nothing,Nothing,ListG (fromList []))])

*)

(* type error slice
(2,4)-(3,63)
(2,21)-(3,61)
(3,3)-(3,61)
(3,39)-(3,55)
(3,39)-(3,61)
(3,40)-(3,51)
*)
