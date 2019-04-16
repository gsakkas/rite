
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (fun b  -> (((f b), ((f b) = b)), b));;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun b  -> ((f b), ((f b) = b))), b);;

*)

(* changed spans
(5,29)-(5,66)
(fun b -> (f b , f b = b) , b)
TupleG (fromList [VarG,LamG VarPatG EmptyG])

*)

(* type error slice
(3,42)-(3,48)
(3,42)-(3,56)
(3,49)-(3,56)
(5,22)-(5,28)
(5,22)-(5,66)
(5,29)-(5,66)
*)
