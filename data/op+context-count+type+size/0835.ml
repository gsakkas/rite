
let rec wwhile (f,b) = let (a,b) = f b in if b then wwhile f a else a;;


(* fix

let rec wwhile (f,b) = let (a,b) = f b in 5;;

*)

(* changed spans
(2,43)-(2,70)
(2,46)-(2,47)
(2,53)-(2,63)
(2,69)-(2,70)
*)

(* type error slice
(2,4)-(2,72)
(2,17)-(2,70)
(2,53)-(2,59)
(2,53)-(2,63)
(2,60)-(2,61)
*)
