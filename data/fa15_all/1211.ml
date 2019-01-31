
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' = false then b' else f b';;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' = false then b' else wwhile (f, b');;

*)

(* changed spans
(3,57)-(3,58)
wwhile
VarG

(3,57)-(3,58)
(f , b')
TupleG (fromList [VarG])

*)
