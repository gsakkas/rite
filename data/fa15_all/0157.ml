
let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile (((f b), ((not f b) = b)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile ((fun x  -> (x, ((f x) = x))), b);;

*)

(* changed spans
(5,29)-(5,53)
fun x -> (x , f x = x)
LamG (TupleG (fromList [EmptyG]))

(5,33)-(5,34)
x
VarG

(5,39)-(5,42)
f x
AppG (fromList [VarG])

(5,50)-(5,51)
x
VarG

(5,55)-(5,56)
x
VarG

*)
