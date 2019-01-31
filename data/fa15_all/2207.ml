
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((f, ((f b) != b)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((fun x  -> ((f b), (3 < 4))), b);;

*)

(* changed spans
(5,29)-(5,46)
fun x -> (f b , 3 < 4)
LamG (TupleG (fromList [EmptyG]))

(5,43)-(5,44)
3 < 4
BopG LitG LitG

(5,48)-(5,49)
3
LitG

(5,48)-(5,49)
4
LitG

*)
