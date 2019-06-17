
let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile (fun x  -> ((x, ((f x) = x)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile ((fun x  -> (x, ((f x) = x))), b);;

*)

(* changed spans
(5,29)-(5,62)
(fun x -> (x , f x = x) , b)
TupleG [LamG EmptyPatG EmptyG,VarG]

*)

(* type error slice
(3,51)-(3,57)
(3,51)-(3,64)
(3,58)-(3,64)
(5,22)-(5,28)
(5,22)-(5,62)
(5,29)-(5,62)
*)
