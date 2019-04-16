
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let fin (f,b) = (b, ((f b) = b)) in (fin, b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let fin bt = (bt, ((f bt) = bt)) in (fin, b));;

*)

(* changed spans
(4,39)-(4,62)
fun bt -> (bt , f bt = bt)
LamG VarPatG (TupleG (fromList [EmptyG]))

*)

(* type error slice
(2,4)-(2,80)
(2,17)-(2,78)
(2,24)-(2,78)
(2,38)-(2,39)
(2,38)-(2,41)
(2,40)-(2,41)
(2,56)-(2,62)
(2,56)-(2,70)
(2,63)-(2,70)
(2,67)-(2,69)
(4,22)-(4,28)
(4,22)-(4,75)
(4,29)-(4,75)
(4,39)-(4,62)
(4,46)-(4,62)
(4,47)-(4,48)
(4,66)-(4,74)
(4,67)-(4,70)
*)
