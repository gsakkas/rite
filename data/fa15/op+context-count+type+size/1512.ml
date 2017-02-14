
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | true  -> wwhile f b';;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in match c' with | false  -> b';;

*)

(* changed spans
(3,3)-(3,75)
(3,24)-(3,75)
(3,64)-(3,75)
*)

(* type error slice
(2,4)-(3,77)
(2,17)-(3,75)
(3,64)-(3,70)
(3,64)-(3,75)
(3,71)-(3,72)
*)
