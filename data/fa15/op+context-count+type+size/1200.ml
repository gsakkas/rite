
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then wwhile f b' else b';;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

*)

(* changed spans
(3,32)-(3,37)
(3,43)-(3,49)
(3,43)-(3,54)
(3,50)-(3,51)
*)

(* type error slice
(2,4)-(3,64)
(2,17)-(3,62)
(3,43)-(3,49)
(3,43)-(3,54)
(3,50)-(3,51)
*)
