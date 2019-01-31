
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) = ((wwhile (fun x  -> ((wwhile (f, b)), (b = (f b))))), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun x  -> ((f x), (b = (f b)))), b);;

*)

(* changed spans
(5,30)-(5,72)
(fun x -> (f x , b = f b) , b)
TupleG (fromList [VarG,LamG EmptyG])

(5,54)-(5,55)
x
VarG

*)
