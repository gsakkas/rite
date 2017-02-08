
let rec wwhile (f,b) =
  match f with | (x,true ) -> wwhile (f x) | (x,false ) -> x;;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

*)

(* changed spans
(3,9)-(3,10)
(3,31)-(3,42)
(3,39)-(3,42)
*)

(* type error slice
(2,4)-(3,63)
(2,17)-(3,61)
(3,3)-(3,61)
(3,9)-(3,10)
(3,31)-(3,37)
(3,31)-(3,42)
(3,39)-(3,40)
(3,39)-(3,42)
*)
