
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let fx = ((f b), ((f b) = b)) in wwhile (fx, b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let fx b = ((f b), ((f b) = b)) in wwhile (fx, b);;

*)

(* changed spans
(4,31)-(4,51)
fun b -> (f b , f b = b)
LamG VarPatG (TupleG (fromList [EmptyG]))

*)

(* type error slice
(2,38)-(2,39)
(2,38)-(2,41)
(2,56)-(2,62)
(2,56)-(2,70)
(2,63)-(2,70)
(2,64)-(2,65)
(4,22)-(4,69)
(4,31)-(4,51)
(4,55)-(4,61)
(4,55)-(4,69)
(4,62)-(4,69)
(4,63)-(4,65)
*)
