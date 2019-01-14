
let helper f b = if (f b) = b then true else false;;

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((helper f b), b);;


(* fix

let helper f b = if (f b) = b then (true, b) else (false, (f b));;

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((helper f), b);;

*)

(* changed spans
(2,35)-(2,39)
(true , b)
TupleG (fromList [VarG,LitG])

(2,45)-(2,50)
b
VarG

(2,45)-(2,50)
(false , f b)
TupleG (fromList [AppG (fromList [EmptyG]),LitG])

(4,16)-(5,63)
f
VarG

(4,16)-(5,63)
b
VarG

(4,16)-(5,63)
f b
AppG (fromList [VarG])

(7,29)-(7,41)
helper f
AppG (fromList [VarG])

*)
