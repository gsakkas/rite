
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((f, ((f b) = b)), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let h x = ((f x), ((f x) = x)) in (h, b));;

*)

(* changed spans
(4,28)-(4,49)
let h =
  fun x -> (f x , f x = x) in
(h , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

(4,29)-(4,45)
fun x -> (f x , f x = x)
LamG (TupleG (fromList [EmptyG]))

(4,30)-(4,31)
f x
AppG (fromList [VarG])

(4,33)-(4,44)
x
VarG

(4,42)-(4,43)
x
VarG

(4,47)-(4,48)
x
VarG

(4,47)-(4,48)
h
VarG

(4,47)-(4,48)
(h , b)
TupleG (fromList [VarG])

*)
