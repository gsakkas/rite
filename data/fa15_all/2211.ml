
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((f, (not ((f b) = b))) b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((fun x  -> ((f b), (3 < 4))), b);;

*)

(* changed spans
(5,29)-(5,55)
(fun x -> (f b , 3 < 4) , b)
TupleG (fromList [VarG,LamG VarPatG EmptyG])

*)

(* type error slice
(5,29)-(5,55)
(5,30)-(5,52)
*)
