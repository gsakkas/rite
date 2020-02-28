
let rec wwhile (f,b) =
  let (b',c') = b in match c' with | true  -> wwhile (f, b') | false  -> b';;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | true  -> wwhile (f, b') | false  -> b';;

*)

(* changed spans
(3,17)-(3,18)
f b
AppG [VarG]

*)

(* type error slice
(2,4)-(3,78)
(2,17)-(3,76)
(3,3)-(3,76)
(3,17)-(3,18)
(3,47)-(3,53)
(3,47)-(3,61)
(3,54)-(3,61)
(3,58)-(3,60)
*)
