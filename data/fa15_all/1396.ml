
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (let fin b' = (b', ((f b') = b')) in ((fin b), b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let fin bt = (bt, ((f bt) = bt)) in (fin, b));;

*)

(* changed spans
(5,18)-(5,42)
fun bt -> (bt , f bt = bt)
LamG (TupleG (fromList [EmptyG]))

(5,24)-(5,26)
bt
VarG

(5,38)-(5,40)
bt
VarG

(5,46)-(5,58)
bt
VarG

*)
