
let rec wwhile (f,b) =
  match f b with | (k,tf) -> if tf = false then k else wwhile (f, k);;

let fixpoint (f,b) = wwhile (fun a  -> ((f a), ((f a) != a), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (k,tf) -> if tf = false then k else wwhile (f, k);;

let fixpoint (f,b) = wwhile ((fun a  -> ((f a), ((f a) != a))), b);;

*)

(* changed spans
(5,28)-(5,64)
(fun a ->
   (f a , f a <> a) , b)
TupleG (fromList [VarG,LamG EmptyG])

(5,39)-(5,63)
(f a , f a <> a)
TupleG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

*)
