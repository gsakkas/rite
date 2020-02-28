
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
(6,41)-(6,42)
(b , true)
TupleG [VarG,LitG]

(6,48)-(6,51)
(f b , false)
TupleG [AppG [EmptyG],LitG]

(6,55)-(6,61)
f'
VarG

*)

(* type error slice
(6,11)-(6,62)
(6,19)-(6,51)
(6,48)-(6,49)
(6,48)-(6,51)
(6,50)-(6,51)
(6,55)-(6,57)
(6,55)-(6,61)
(6,58)-(6,59)
*)
