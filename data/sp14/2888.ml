
let rec wwhile (f,b) = match f with | (n,boo) -> f b;;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

*)

(* changed spans
(2,23)-(2,52)
(2,29)-(2,30)
*)

(* type error slice
(2,23)-(2,52)
(2,29)-(2,30)
(2,49)-(2,50)
(2,49)-(2,52)
*)

(* all spans
(2,16)-(2,52)
(2,23)-(2,52)
(2,29)-(2,30)
(2,49)-(2,52)
(2,49)-(2,50)
(2,51)-(2,52)
*)
