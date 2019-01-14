
let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile ((b, ((f b) = b)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile ((fun x  -> (x, ((f x) = x))), b);;

*)

(* changed spans
(5,29)-(5,45)
fun x -> (x , f x = x)
LamG (TupleG (fromList [EmptyG]))

(5,30)-(5,31)
x
VarG

(5,42)-(5,43)
x
VarG

(5,47)-(5,48)
x
VarG

*)
