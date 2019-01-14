
let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile (((f b), ((f b) = b)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile ((fun x  -> (x, ((f x) = x))), b);;

*)

(* changed spans
(5,29)-(5,49)
fun x -> (x , f x = x)
LamG (TupleG (fromList [EmptyG]))

(5,33)-(5,34)
x
VarG

(5,46)-(5,47)
x
VarG

(5,51)-(5,52)
x
VarG

*)
