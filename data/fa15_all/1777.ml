
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f b') else b';;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

*)

(* changed spans
(3,48)-(3,54)
(f , b')
TupleG (fromList [VarG])

*)
