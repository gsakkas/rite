
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
(7,16)-(7,46)
fun b ->
  (f b , (b = f b) = false)
LamG (TupleG (fromList [EmptyG]))

*)
