
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let f' = ((f b), ((f b) = b)) in wwhile (f', b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let f b = ((f b), (b = (f b))) in wwhile (f, b);;

*)

(* changed spans
(4,21)-(4,68)
let f =
  fun b -> (f b , b = f b) in
wwhile (f , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(4,30)-(4,50)
fun b -> (f b , b = f b)
LamG (TupleG (fromList [EmptyG]))

(4,39)-(4,44)
b
VarG

(4,62)-(4,64)
f
VarG

*)
