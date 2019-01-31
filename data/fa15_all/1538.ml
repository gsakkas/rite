
let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile ((let f' b' = if (f b') = b then b else f b' in f' b), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile
    ((let f' b = if (f b) = b then (b, true) else ((f b), false) in f'), b);;

*)

(* changed spans
(6,18)-(6,53)
fun b ->
  if f b = b
  then (b , true)
  else (f b , false)
LamG (IteG EmptyG EmptyG EmptyG)

(6,49)-(6,53)
b
VarG

(6,49)-(6,53)
true
LitG

(6,49)-(6,53)
(b , true)
TupleG (fromList [VarG,LitG])

(6,49)-(6,53)
(f b , false)
TupleG (fromList [AppG (fromList [EmptyG]),LitG])

(6,64)-(6,65)
f'
VarG

(6,64)-(6,65)
false
LitG

*)
