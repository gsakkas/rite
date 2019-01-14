
let fixpointHelper (f,b) = if (f b) = b then (b, true) else (b, false);;

let rec wwhile (f,b) =
  match f b with | (num,expr) -> if expr then wwhile (f, num) else num;;

let fixpoint (f,b) = wwhile ((fixpointHelper (f, b)), b);;


(* fix

let fixpointHelper f b b = ((f b), (if (f b) = b then true else false));;

let rec wwhile (f,b) =
  match f b with | (num,expr) -> if expr then wwhile (f, num) else num;;

let fixpoint (f,b) = wwhile ((fixpointHelper f b), b);;

*)

(* changed spans
(2,20)-(2,70)
fun f ->
  fun b ->
    fun b ->
      (f b , if f b = b
             then true
             else false)
LamG (LamG EmptyG)

(2,27)-(2,70)
f
VarG

(2,27)-(2,70)
b
VarG

(2,27)-(2,70)
fun b ->
  fun b ->
    (f b , if f b = b
           then true
           else false)
LamG (LamG EmptyG)

(2,27)-(2,70)
fun b ->
  (f b , if f b = b
         then true
         else false)
LamG (TupleG (fromList [EmptyG]))

(2,27)-(2,70)
f b
AppG (fromList [VarG])

(2,27)-(2,70)
(f b , if f b = b
       then true
       else false)
TupleG (fromList [AppG (fromList [EmptyG]),IteG EmptyG EmptyG EmptyG])

(7,29)-(7,52)
fixpointHelper f b
AppG (fromList [VarG])

*)
