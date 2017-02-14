
let rec wwhile (f,b) =
  match f with | (x,true ) -> wwhile (f x) | (x,false ) -> x;;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

*)

(* changed spans
(3,8)-(3,9)
(3,30)-(3,42)
(3,37)-(3,42)
*)

(* type error slice
(2,3)-(3,62)
(2,16)-(3,60)
(3,2)-(3,60)
(3,8)-(3,9)
(3,30)-(3,36)
(3,30)-(3,42)
(3,37)-(3,42)
(3,38)-(3,39)
*)
