
let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((fun f  -> fun x  -> x = (f x)), b);;


(* fix

let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((fun y  -> ((f b), (b = (f b)))), b);;

*)

(* changed spans
(4,30)-(4,61)
fun y -> (f b , b = f b)
LamG VarPatG (TupleG [EmptyG,EmptyG])

*)

(* type error slice
(2,24)-(2,73)
(2,36)-(2,37)
(2,36)-(2,39)
(2,53)-(2,59)
(2,53)-(2,66)
(2,60)-(2,66)
(2,61)-(2,62)
(4,22)-(4,28)
(4,22)-(4,65)
(4,29)-(4,65)
(4,30)-(4,61)
(4,41)-(4,60)
*)
