
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
(6,10)-(6,55)
fun x -> (x , f x = x)
LamG (TupleG (fromList [EmptyG]))

(6,14)-(6,23)
x
VarG

(6,14)-(6,23)
(x , f x = x)
TupleG (fromList [VarG,BopG EmptyG EmptyG])

(6,49)-(6,53)
x
VarG

(6,57)-(6,58)
x
VarG

*)
