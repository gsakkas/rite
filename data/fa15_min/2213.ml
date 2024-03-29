
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (let func x = f x in (f, (not ((f b) = b)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((fun x  -> ((f b), (3 < 4))), b);;

*)

(* changed spans
(5,29)-(5,76)
(fun x -> (f b , 3 < 4) , b)
TupleG [LamG EmptyPatG EmptyG,VarG]

*)

(* type error slice
(3,50)-(3,56)
(3,50)-(3,63)
(3,57)-(3,63)
(5,22)-(5,28)
(5,22)-(5,76)
(5,29)-(5,76)
(5,50)-(5,75)
*)
