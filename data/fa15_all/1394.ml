
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (let fin (f',b') = (b', ((f' b') = b')) in ((fin (f, b)), b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let fin bt = (bt, ((f bt) = bt)) in (fin, b));;

*)

(* changed spans
(5,20)-(5,49)
fun bt -> (bt , f bt = bt)
LamG VarPatG (TupleG (fromList [EmptyG]))

(5,54)-(5,66)
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
(5,3)-(5,71)
(5,10)-(5,71)
(5,20)-(5,49)
(5,29)-(5,49)
(5,53)-(5,70)
(5,54)-(5,66)
(5,55)-(5,58)
*)
