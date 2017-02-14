
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | true  -> wwhile (f b');;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in match c' with | false  -> b';;

*)

(* changed spans
(3,3)-(3,76)
(3,24)-(3,76)
(3,64)-(3,76)
*)

(* type error slice
(2,4)-(3,79)
(2,17)-(3,76)
(3,64)-(3,70)
(3,64)-(3,76)
(3,72)-(3,73)
(3,72)-(3,76)
*)
