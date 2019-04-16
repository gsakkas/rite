
let rec wwhile (f,b) =
  match f b with | (k,tf) -> if tf = false then k else wwhile (f, k);;

let fixpoint (f,b) = wwhile (fun a  -> ((f a), ((f a) != a), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (k,tf) -> if tf = false then k else wwhile (f, k);;

let fixpoint (f,b) = wwhile ((fun a  -> ((f a), ((f a) != a))), b);;

*)

(* changed spans
(5,29)-(5,65)
(fun a ->
   (f a , f a <> a) , b)
TupleG (fromList [VarG,LamG VarPatG EmptyG])

*)

(* type error slice
(3,56)-(3,62)
(3,56)-(3,69)
(3,63)-(3,69)
(5,22)-(5,28)
(5,22)-(5,65)
(5,29)-(5,65)
*)
