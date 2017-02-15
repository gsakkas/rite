
let rec wwhile (f,b) = match f b with | (a,c) -> if not c then a else f a;;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

*)

(* changed spans
(2,70)-(2,71)
*)

(* type error slice
(2,23)-(2,73)
(2,29)-(2,30)
(2,29)-(2,32)
(2,49)-(2,73)
(2,49)-(2,73)
(2,63)-(2,64)
(2,70)-(2,71)
(2,70)-(2,73)
*)
