
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let fin (f,b) = (b, ((f b) = b)) in (fin, b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let fin bt = (bt, ((f bt) = bt)) in (fin, b));;

*)

(* changed spans
(4,38)-(4,61)
fun bt -> (bt , f bt = bt)
LamG (TupleG (fromList [EmptyG]))

(4,46)-(4,47)
bt
VarG

(4,58)-(4,59)
bt
VarG

(4,65)-(4,73)
bt
VarG

*)
