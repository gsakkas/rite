
let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) =
  wwhile ((if (f b) = b then (b, false) else (b, true)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile ((fun x  -> (x, ((f x) = x))), b);;

*)

(* changed spans
(6,11)-(6,56)
fun x -> (x , f x = x)
LamG VarPatG (TupleG [EmptyG,EmptyG])

*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,51)-(3,57)
(3,51)-(3,64)
(3,58)-(3,64)
(3,59)-(3,60)
(6,3)-(6,9)
(6,3)-(6,60)
(6,10)-(6,60)
(6,11)-(6,56)
(6,46)-(6,55)
*)
