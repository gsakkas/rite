
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (((f b), ((f b) = b)), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let h x = ((f x), ((f x) = x)) in (h, b));;

*)

(* changed spans
(4,28)-(4,53)
let h =
  fun x -> (f x , f x = x) in
(h , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

(4,29)-(4,49)
fun x -> (f x , f x = x)
LamG (TupleG (fromList [EmptyG]))

(4,33)-(4,34)
x
VarG

(4,46)-(4,47)
x
VarG

(4,51)-(4,52)
x
VarG

(4,51)-(4,52)
h
VarG

(4,51)-(4,52)
(h , b)
TupleG (fromList [VarG])

*)
