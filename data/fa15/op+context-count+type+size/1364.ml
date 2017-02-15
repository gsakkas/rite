
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | true  -> wwhile f b';;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in match c' with | false  -> b';;

*)

(* changed spans
(3,2)-(3,74)
(3,23)-(3,74)
(3,63)-(3,74)
*)

(* type error slice
(2,3)-(3,76)
(2,16)-(3,74)
(3,63)-(3,69)
(3,63)-(3,74)
(3,70)-(3,71)
*)
