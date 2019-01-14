
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile ((match b with | b' -> if b = b' then false else true), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    ((fun b'  -> if (f b') = b' then ((f b'), false) else ((f b'), true)), b);;

*)

(* changed spans
(6,17)-(6,18)
fun b' ->
  if f b' = b'
  then (f b' , false)
  else (f b' , true)
LamG (IteG EmptyG EmptyG EmptyG)

(6,35)-(6,36)
f b'
AppG (fromList [VarG])

(6,39)-(6,41)
f
VarG

(6,47)-(6,52)
b'
VarG

(6,47)-(6,52)
f
VarG

(6,47)-(6,52)
b'
VarG

(6,47)-(6,52)
f b'
AppG (fromList [VarG])

(6,47)-(6,52)
(f b' , false)
TupleG (fromList [AppG (fromList [EmptyG]),LitG])

(6,58)-(6,62)
f
VarG

(6,58)-(6,62)
b'
VarG

(6,58)-(6,62)
f b'
AppG (fromList [VarG])

(6,58)-(6,62)
(f b' , true)
TupleG (fromList [AppG (fromList [EmptyG]),LitG])

*)
