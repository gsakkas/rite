
let rec wwhile (f,b) =
  match f with | (x,true ) -> wwhile (f x) | (x,false ) -> x;;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

*)

(* changed spans
(3,8)-(3,9)
f b
AppG [VarG]

(3,30)-(3,42)
b
VarG

(3,37)-(3,42)
(f , x)
TupleG [VarG,VarG]

*)
