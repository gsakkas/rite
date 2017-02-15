
let rec wwhile (f,b) =
  let (b',c') = f b in if not c' then b' else wwhile f b';;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if not c' then b' else wwhile (f, b');;

*)

(* changed spans
(3,46)-(3,57)
(3,53)-(3,54)
*)

(* type error slice
(2,3)-(3,59)
(2,16)-(3,57)
(3,46)-(3,52)
(3,46)-(3,57)
(3,53)-(3,54)
*)
