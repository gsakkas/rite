
let rec wwhile (f,b) = match f with | (x,true ) -> f x | (x,false ) -> x;;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

*)

(* changed spans
(2,29)-(2,30)
f b
AppG (fromList [VarG])

(2,51)-(2,52)
wwhile
VarG

(2,51)-(2,52)
(f , x)
TupleG (fromList [VarG])

(2,51)-(2,54)
b
VarG

*)
