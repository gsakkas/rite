
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (let fin b' = (b', ((f b') = b')) in ((fin b), b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let fin bt = (bt, ((f bt) = bt)) in (fin, b));;

*)

(* changed spans
(5,19)-(5,43)
fun bt -> (bt , f bt = bt)
LamG VarPatG (TupleG [EmptyG,EmptyG])

(5,48)-(5,55)
fin
VarG

*)

(* type error slice
(2,38)-(2,39)
(2,38)-(2,41)
(2,56)-(2,62)
(2,56)-(2,70)
(2,63)-(2,70)
(2,64)-(2,65)
(5,3)-(5,9)
(5,3)-(5,60)
(5,10)-(5,60)
(5,19)-(5,43)
(5,24)-(5,43)
(5,47)-(5,59)
(5,48)-(5,55)
(5,49)-(5,52)
*)
