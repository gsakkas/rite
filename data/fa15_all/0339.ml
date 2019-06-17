
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
(3,3)-(3,57)
fun b ->
  (f b , if f b = b
         then true
         else false)
LamG VarPatG (TupleG [EmptyG,EmptyG])

*)

(* type error slice
(2,4)-(3,59)
(2,20)-(3,57)
(2,22)-(3,57)
(3,3)-(3,57)
(3,18)-(3,57)
(3,47)-(3,57)
(6,9)-(6,10)
(6,9)-(6,12)
(6,47)-(6,53)
(6,47)-(6,62)
(6,54)-(6,62)
(6,55)-(6,56)
(8,22)-(8,28)
(8,22)-(8,54)
(8,29)-(8,54)
(8,30)-(8,50)
(8,31)-(8,45)
*)
