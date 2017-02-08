
let rec wwhile (f,b) = let (a,b) = f b in if b then wwhile (f a) else a;;


(* fix

let rec wwhile (f,b) = let (a,b) = f b in 5;;

*)

(* changed spans
(2,43)-(2,72)
(2,46)-(2,47)
(2,53)-(2,64)
(2,71)-(2,72)
*)

(* type error slice
(2,4)-(2,74)
(2,17)-(2,72)
(2,53)-(2,59)
(2,53)-(2,64)
(2,61)-(2,62)
(2,61)-(2,64)
*)
