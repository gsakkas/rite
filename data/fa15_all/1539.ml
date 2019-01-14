
let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile ((let f' b = if (f b) = b then b else f b in f' f b), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile
    ((let f' b = if (f b) = b then (b, true) else ((f b), false) in f'), b);;

*)

(* changed spans
(6,40)-(6,41)
(b , true)
TupleG (fromList [VarG,LitG])

(6,47)-(6,50)
true
LitG

(6,47)-(6,50)
(f b , false)
TupleG (fromList [AppG (fromList [EmptyG]),LitG])

(6,54)-(6,60)
false
LitG

*)
