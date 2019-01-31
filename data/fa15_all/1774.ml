
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then wwhile (f b') else b';;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

*)

(* changed spans
(3,31)-(3,36)
true
LitG

(3,49)-(3,55)
(f , b')
TupleG (fromList [VarG])

*)
