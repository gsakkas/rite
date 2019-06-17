
let rec wwhile (f,b) =
  let z = f b in
  match z with | (x,y) -> if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  let newFunc = ((f b), ((b = (f b)) = false)) in wwhile (newFunc, b);;


(* fix

let rec wwhile (f,b) =
  let z = f b in
  match z with | (x,y) -> if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  let newFunc b = ((f b), ((b = (f b)) = false)) in wwhile (newFunc, b);;

*)

(* changed spans
(7,17)-(7,47)
fun b ->
  (f b , (b = f b) = false)
LamG VarPatG (TupleG [EmptyG,EmptyG])

*)

(* type error slice
(3,11)-(3,12)
(3,11)-(3,14)
(4,52)-(4,58)
(4,52)-(4,65)
(4,59)-(4,65)
(4,60)-(4,61)
(7,3)-(7,70)
(7,17)-(7,47)
(7,51)-(7,57)
(7,51)-(7,70)
(7,58)-(7,70)
(7,59)-(7,66)
*)
