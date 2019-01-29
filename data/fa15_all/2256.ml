
let rec wwhile (f,b) =
  let (b',c') = f b in if not c' then b' else wwhile f b';;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if not c' then b' else wwhile (f, b');;

*)

(* changed spans
(3,46)-(3,57)
wwhile (f , b')
AppG (fromList [TupleG (fromList [EmptyG])])

(3,53)-(3,54)
(f , b')
TupleG (fromList [VarG])

*)
