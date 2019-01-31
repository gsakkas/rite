
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (let fin (f',b') = (b', ((f' b') = b')) in ((fin (f, b)), b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let fin bt = (bt, ((f bt) = bt)) in (fin, b));;

*)

(* changed spans
(5,19)-(5,48)
fun bt -> (bt , f bt = bt)
LamG (TupleG (fromList [EmptyG]))

(5,29)-(5,31)
bt
VarG

(5,44)-(5,46)
f
VarG

(5,52)-(5,69)
bt
VarG

(5,52)-(5,69)
bt
VarG

*)
