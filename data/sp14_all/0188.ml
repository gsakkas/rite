
let rec listReverse l =
  match l with
  | [] -> []
  | hd::tl -> if hd != [] then (listReverse tl) :: hd else hd;;


(* fix

let rec listReverse l = match l with | [] -> [] | _::tl -> listReverse tl;;

*)

(* changed spans
(3,3)-(5,62)
match l with
| [] -> []
| _ :: tl -> listReverse tl
CaseG (fromList [(ConsPatG WildPatG VarPatG,Nothing,AppG (fromList [EmptyG])),(ConPatG Nothing,Nothing,ListG (fromList []))])

(5,15)-(5,62)
listReverse tl
AppG (fromList [VarG])

*)

(* type error slice
(2,4)-(5,64)
(2,21)-(5,62)
(3,3)-(5,62)
(5,15)-(5,62)
(5,32)-(5,48)
(5,32)-(5,54)
(5,33)-(5,44)
(5,52)-(5,54)
(5,60)-(5,62)
*)
