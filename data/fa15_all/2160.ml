
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun x  -> if b f b then b else f b), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun x  -> ((f b), ((f b) = b))), b);;

*)

(* changed spans
(5,43)-(5,44)
(f b , f b = b)
TupleG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

(5,45)-(5,46)
f b
AppG (fromList [VarG])

(5,54)-(5,55)
f b = b
BopG (AppG (fromList [EmptyG])) VarG

*)
