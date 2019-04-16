
let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile (((f b), (not ((f b) = b))), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile ((fun x  -> (x, ((f x) = x))), b);;

*)

(* changed spans
(5,30)-(5,56)
fun x -> (x , f x = x)
LamG VarPatG (TupleG (fromList [EmptyG]))

*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,51)-(3,57)
(3,51)-(3,64)
(3,58)-(3,64)
(3,59)-(3,60)
(5,22)-(5,28)
(5,22)-(5,60)
(5,29)-(5,60)
(5,30)-(5,56)
*)
