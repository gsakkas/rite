
let rec wwhile (f,b) = let (x,y) = f b in if y then (wwhile f) * x else x;;


(* fix

let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, y) else x;;

*)

(* changed spans
(2,60)-(2,61)
(f , y)
TupleG (fromList [VarG])

(2,65)-(2,66)
y
VarG

*)
