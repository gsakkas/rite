
let stringOfList f l =
  let fx a b = List.append b [f a] in
  let base = [] in
  List.fold_left f base l f (f (f (f (f (f (f base 1) 2) 3) 4) 5) 6);;


(* fix

let stringOfList f l =
  let fx a b = a ^ b in let base = "" in List.fold_left fx base l;;

*)

(* changed spans
(3,30)-(3,31)
(^)
VarG

(4,2)-(5,68)
b
VarG

(5,2)-(5,16)
List.fold_left fx base l
AppG (fromList [VarG])

(5,2)-(5,68)
""
LitG

(5,17)-(5,18)
fx
VarG

*)
