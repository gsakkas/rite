
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (fun x  -> (f, b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((fun x  -> ((f b), (3 < 4))), b);;

*)

(* changed spans
(5,29)-(5,47)
(fun x -> (f b , 3 < 4) , b)
TupleG (fromList [VarG,LamG VarPatG EmptyG])

*)

(* type error slice
(3,50)-(3,56)
(3,50)-(3,63)
(3,57)-(3,63)
(5,22)-(5,28)
(5,22)-(5,47)
(5,29)-(5,47)
*)
