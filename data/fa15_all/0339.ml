
let fixpointHelper f b =
  let c = f b in if c = b then (c, true) else (c, false);;

let rec wwhile (f,b) =
  match f b with | (num,expr) -> if expr then wwhile (f, num) else num;;

let fixpoint (f,b) = wwhile ((fixpointHelper f b), b);;


(* fix

let fixpointHelper f b b = ((f b), (if (f b) = b then true else false));;

let rec wwhile (f,b) =
  match f b with | (num,expr) -> if expr then wwhile (f, num) else num;;

let fixpoint (f,b) = wwhile ((fixpointHelper f b), b);;

*)

(* changed spans
(3,2)-(3,56)
fun b ->
  (f b , if f b = b
         then true
         else false)
LamG (TupleG (fromList [EmptyG]))

(3,10)-(3,13)
(f b , if f b = b
       then true
       else false)
TupleG (fromList [AppG (fromList [EmptyG]),IteG EmptyG EmptyG EmptyG])

(3,20)-(3,21)
f b
AppG (fromList [VarG])

(3,24)-(3,25)
f
VarG

(3,32)-(3,33)
b
VarG

*)
