
let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile (((f b), (not ((f b) = b))), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile ((fun x  -> (x, ((f x) = x))), b);;

*)

(* changed spans
(5,29)-(5,55)
fun x -> (x , f x = x)
LamG (TupleG (fromList [EmptyG]))

(5,38)-(5,41)
x
VarG

(5,51)-(5,52)
x
VarG

(5,57)-(5,58)
x
VarG

*)
