
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let helper b = if (f b) = b then false else true in wwhile (helper, b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let helper b = if (f b) = b then (b, false) else ((f b), true) in
  wwhile (helper, b);;

*)

(* changed spans
(5,35)-(5,40)
b
VarG

(5,35)-(5,40)
(b , false)
TupleG (fromList [VarG,LitG])

(5,46)-(5,50)
f
VarG

(5,46)-(5,50)
b
VarG

(5,46)-(5,50)
f b
AppG (fromList [VarG])

(5,46)-(5,50)
(f b , true)
TupleG (fromList [AppG (fromList [EmptyG]),LitG])

*)
