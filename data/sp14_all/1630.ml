
let rec wwhile (f,b) = match f with | (x,true ) -> f x | (x,false ) -> x;;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

*)

(* changed spans
(2,30)-(2,31)
f b
AppG [VarG]

(2,52)-(2,55)
wwhile (f , x)
AppG [TupleG [EmptyG,EmptyG]]

*)

(* type error slice
(2,24)-(2,73)
(2,30)-(2,31)
(2,52)-(2,53)
(2,52)-(2,55)
*)
