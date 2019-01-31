
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let f1 f2 x = if (f2 x) = x then false else true in wwhile ((f1 f), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let f1 f2 x = if (f2 x) = x then (false, x) else (true, (f2 x)) in
  wwhile ((f1 f), b);;

*)

(* changed spans
(6,35)-(6,40)
(false , x)
TupleG (fromList [VarG,LitG])

(6,46)-(6,50)
x
VarG

(6,46)-(6,50)
(true , f2 x)
TupleG (fromList [AppG (fromList [EmptyG]),LitG])

(6,54)-(6,60)
f2
VarG

(6,54)-(6,60)
x
VarG

(6,54)-(6,60)
wwhile (f1 f , b)
AppG (fromList [TupleG (fromList [EmptyG])])

*)
