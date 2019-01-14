
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let helper f b = (((f b) = b), (f b)) in wwhile ((helper f b), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let helper b = let fb = f b in if fb = b then (true, fb) else (false, fb) in
  wwhile (helper, b);;

*)

(* changed spans
(5,20)-(5,31)
let fb = f b in
if fb = b
then (true , fb)
else (false , fb)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (IteG EmptyG EmptyG EmptyG)

(5,34)-(5,35)
if fb = b
then (true , fb)
else (false , fb)
IteG (BopG EmptyG EmptyG) (TupleG (fromList [EmptyG])) (TupleG (fromList [EmptyG]))

(5,36)-(5,37)
fb
VarG

(5,36)-(5,37)
fb = b
BopG VarG VarG

(5,43)-(5,67)
fb
VarG

(5,43)-(5,67)
fb
VarG

(5,43)-(5,67)
true
LitG

(5,43)-(5,67)
false
LitG

(5,43)-(5,67)
(true , fb)
TupleG (fromList [VarG,LitG])

(5,43)-(5,67)
(false , fb)
TupleG (fromList [VarG,LitG])

*)
