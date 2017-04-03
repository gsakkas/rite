
let rec wwhile (f,b) = match f with | (x,true ) -> f x | (x,false ) -> x;;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

*)

(* changed spans
(2,29)-(2,30)
(2,51)-(2,52)
(2,51)-(2,54)
*)

(* type error slice
(2,23)-(2,72)
(2,29)-(2,30)
(2,51)-(2,52)
(2,51)-(2,54)
*)

(* all spans
(2,16)-(2,72)
(2,23)-(2,72)
(2,29)-(2,30)
(2,51)-(2,54)
(2,51)-(2,52)
(2,53)-(2,54)
(2,71)-(2,72)
*)
