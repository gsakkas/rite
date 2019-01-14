
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (let func x = f in (f, (not ((f b) = b)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((fun x  -> ((f b), (3 < 4))), b);;

*)

(* changed spans
(5,28)-(5,73)
(fun x -> (f b , 3 < 4) , b)
TupleG (fromList [VarG,LamG EmptyG])

(5,56)-(5,67)
(f b , 3 < 4)
TupleG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

(5,65)-(5,66)
3 < 4
BopG LitG LitG

(5,70)-(5,71)
3
LitG

(5,70)-(5,71)
4
LitG

*)
