
let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile ((let f' b = if (f b) = b then b else f b in f' b), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (h1,h2) -> if h2 then wwhile (f, h1) else h1;;

let fixpoint (f,b) =
  wwhile
    ((let f' b = if (f b) = b then (b, true) else ((f b), false) in f'), b);;

*)

(* changed spans
(6,41)-(6,42)
(b , true)
TupleG (fromList [VarG,LitG])

(6,48)-(6,51)
(f b , false)
TupleG (fromList [AppG (fromList [EmptyG]),LitG])

(6,55)-(6,59)
f'
VarG

*)

(* type error slice
(3,3)-(3,64)
(3,9)-(3,10)
(3,9)-(3,12)
(3,42)-(3,48)
(3,42)-(3,56)
(3,49)-(3,56)
(3,50)-(3,51)
(3,53)-(3,55)
(6,3)-(6,9)
(6,3)-(6,64)
(6,10)-(6,64)
(6,11)-(6,60)
(6,19)-(6,51)
(6,23)-(6,51)
(6,26)-(6,31)
(6,26)-(6,35)
(6,27)-(6,28)
(6,34)-(6,35)
(6,48)-(6,49)
(6,48)-(6,51)
(6,55)-(6,57)
(6,55)-(6,59)
(6,58)-(6,59)
(6,62)-(6,63)
*)
