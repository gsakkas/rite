
let rec wwhile (f,b) =
  let (b',c') = b in match c' with | true  -> wwhile (f, b') | false  -> b';;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | true  -> wwhile (f, b') | false  -> b';;

*)

(* changed spans
(3,16)-(3,17)
*)

(* type error slice
(2,3)-(3,77)
(2,16)-(3,75)
(3,2)-(3,75)
(3,16)-(3,17)
(3,46)-(3,52)
(3,46)-(3,60)
(3,53)-(3,60)
(3,57)-(3,59)
*)
