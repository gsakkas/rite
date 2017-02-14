
let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

let fixpoint (f,b) = wwhile ((((b * b) * b), (((b * b) * b) < 100)), b);;


(* fix

let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

let fixpoint (f,b) =
  wwhile ((let d x = let xx = f b in (xx, (xx = b)) in d), b);;

*)

(* changed spans
(6,29)-(6,67)
(6,30)-(6,43)
(6,31)-(6,38)
(6,32)-(6,33)
(6,36)-(6,37)
(6,41)-(6,42)
(6,45)-(6,66)
(6,46)-(6,59)
(6,47)-(6,54)
(6,48)-(6,49)
(6,52)-(6,53)
(6,57)-(6,58)
(6,62)-(6,65)
*)

(* type error slice
(3,13)-(3,14)
(3,13)-(3,16)
(4,40)-(4,46)
(4,40)-(4,57)
(4,47)-(4,57)
(4,48)-(4,49)
(6,21)-(6,27)
(6,21)-(6,71)
(6,28)-(6,71)
(6,29)-(6,67)
*)
