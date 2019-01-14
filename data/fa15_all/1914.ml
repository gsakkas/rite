
let rec wwhile (f,b) = match f b with | (b',c') -> if c' then f b' else b';;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

*)

(* changed spans
(2,62)-(2,63)
wwhile
VarG

(2,62)-(2,63)
(f , b')
TupleG (fromList [VarG])

*)
