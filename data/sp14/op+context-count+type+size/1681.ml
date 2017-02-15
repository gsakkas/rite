
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = let b' = f b in if b = b' then b else wwhile (f, b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) =
  let f x = let xx = f b in (xx, (xx <> b)) in wwhile (f, b);;

*)

(* changed spans
(5,21)-(5,72)
(5,30)-(5,33)
(5,37)-(5,72)
(5,40)-(5,41)
(5,40)-(5,46)
(5,44)-(5,46)
(5,52)-(5,53)
*)

(* type error slice
(3,2)-(3,64)
(3,16)-(3,17)
(3,16)-(3,19)
(3,50)-(3,56)
(3,50)-(3,64)
(3,57)-(3,64)
(3,58)-(3,59)
(3,61)-(3,63)
(5,21)-(5,72)
(5,30)-(5,31)
(5,30)-(5,33)
(5,40)-(5,41)
(5,40)-(5,46)
(5,40)-(5,46)
(5,44)-(5,46)
(5,59)-(5,65)
(5,59)-(5,72)
(5,66)-(5,72)
(5,67)-(5,68)
(5,70)-(5,71)
*)
