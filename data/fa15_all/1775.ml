
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then wwhile f b' else b';;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

*)

(* changed spans
(3,42)-(3,48)
wwhile (f , b')
AppG (fromList [TupleG (fromList [EmptyG])])

(3,42)-(3,53)
true
LitG

(3,49)-(3,50)
(f , b')
TupleG (fromList [VarG])

*)
