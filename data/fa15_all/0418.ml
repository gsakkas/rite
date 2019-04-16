
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let funt b = if f b then 0 else 1 in wwhile (funt, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(6,47)-(6,48)
(b , true)
TupleG (fromList [VarG,LitG])

(6,54)-(6,55)
(b , false)
TupleG (fromList [VarG,LitG])

*)

(* type error slice
(3,3)-(4,69)
(3,13)-(3,14)
(3,13)-(3,16)
(4,3)-(4,69)
(4,9)-(4,12)
(4,43)-(4,49)
(4,43)-(4,56)
(4,50)-(4,56)
(4,51)-(4,52)
(6,22)-(6,75)
(6,31)-(6,55)
(6,35)-(6,55)
(6,54)-(6,55)
(6,59)-(6,65)
(6,59)-(6,75)
(6,66)-(6,75)
(6,67)-(6,71)
*)
