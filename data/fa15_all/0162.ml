
let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile (((f b), true), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile ((fun x  -> (x, ((f x) = x))), b);;

*)

(* changed spans
(5,29)-(5,42)
fun x -> (x , f x = x)
LamG (TupleG (fromList [EmptyG]))

(5,30)-(5,35)
x
VarG

(5,30)-(5,35)
f x = x
BopG (AppG (fromList [EmptyG])) VarG

(5,37)-(5,41)
x
VarG

(5,44)-(5,45)
x
VarG

*)
