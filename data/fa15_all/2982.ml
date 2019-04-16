
let stringOfList f l =
  let fx a b = List.append b [f a] in
  let base = [] in
  List.fold_left f base l f (f (f (f (f (f (f base 1) 2) 3) 4) 5) 6);;


(* fix

let stringOfList f l =
  let fx a b = a ^ b in let base = "" in List.fold_left fx base l;;

*)

(* changed spans
(3,16)-(3,35)
a ^ b
AppG (fromList [VarG])

(4,14)-(4,16)
""
LitG

(5,3)-(5,69)
List.fold_left fx base l
AppG (fromList [VarG])

*)

(* type error slice
(4,3)-(5,69)
(4,14)-(4,16)
(5,3)-(5,17)
(5,3)-(5,69)
(5,18)-(5,19)
(5,44)-(5,54)
(5,45)-(5,46)
(5,47)-(5,51)
*)
