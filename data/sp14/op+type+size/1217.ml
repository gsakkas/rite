
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

(* all spans
(2,16)-(4,68)
(3,2)-(4,68)
(3,13)-(3,16)
(3,13)-(3,14)
(3,15)-(3,16)
(4,2)-(4,68)
(4,20)-(4,24)
(4,28)-(4,68)
(4,31)-(4,34)
(4,40)-(4,57)
(4,40)-(4,46)
(4,47)-(4,57)
(4,48)-(4,49)
(4,51)-(4,56)
(4,63)-(4,68)
(6,14)-(6,47)
(6,21)-(6,47)
(6,21)-(6,27)
(6,28)-(6,47)
(6,29)-(6,43)
(6,30)-(6,35)
(6,31)-(6,32)
(6,33)-(6,34)
(6,37)-(6,42)
(6,45)-(6,46)
*)
