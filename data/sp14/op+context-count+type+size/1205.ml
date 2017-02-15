
let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

let fixpoint (f,b) = wwhile (((f b), false), b);;


(* fix

let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

let fixpoint (f,b) =
  wwhile ((let d x = let xx = f b in (xx, (xx = b)) in d), b);;

*)

(* changed spans
(6,29)-(6,43)
(6,30)-(6,35)
(6,37)-(6,42)
(6,45)-(6,46)
*)

(* type error slice
(3,13)-(3,14)
(3,13)-(3,16)
(4,40)-(4,46)
(4,40)-(4,57)
(4,47)-(4,57)
(4,48)-(4,49)
(6,21)-(6,27)
(6,21)-(6,47)
(6,28)-(6,47)
(6,29)-(6,43)
*)
