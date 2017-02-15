
let rec wwhile (f,b) = let (a,b) = f b in if b then wwhile (f a) else a;;


(* fix

let rec wwhile (f,b) = let (a,b) = f b in 5;;

*)

(* changed spans
(2,42)-(2,71)
(2,45)-(2,46)
(2,52)-(2,64)
(2,70)-(2,71)
*)

(* type error slice
(2,3)-(2,73)
(2,16)-(2,71)
(2,52)-(2,58)
(2,52)-(2,64)
(2,59)-(2,64)
(2,60)-(2,61)
*)
