
let stringOfList f l = List.map (f, l);;


(* fix

let stringOfList f l = match l with | x::[] -> "[" ^ (x ^ "]");;

*)

(* changed spans
(2,24)-(2,39)
match l with
| x :: [] -> "[" ^ (x ^ "]")
CaseG (fromList [(ConsPatG VarPatG (ConPatG Nothing),Nothing,AppG (fromList [EmptyG]))])

*)

(* type error slice
(2,24)-(2,32)
(2,24)-(2,39)
(2,33)-(2,39)
*)
