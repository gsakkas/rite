
let rec wwhile (f,b) = match f b with | (a,c) -> if not c then a else f a;;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

*)

(* changed spans
(2,70)-(2,71)
wwhile
VarG

(2,70)-(2,71)
(f , a)
TupleG (fromList [VarG])

*)
