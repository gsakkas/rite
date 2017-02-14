
let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

let fixpoint (f,b) = wwhile (let xx = (b * b) * b in ((xx, (xx < 100)), b));;


(* fix

let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

let fixpoint (f,b) =
  wwhile ((let d x = let xx = f b in (xx, (xx = b)) in d), b);;

*)

(* changed spans
(6,28)-(6,75)
(6,38)-(6,45)
(6,38)-(6,49)
(6,39)-(6,40)
(6,43)-(6,44)
(6,48)-(6,49)
(6,54)-(6,70)
(6,59)-(6,69)
(6,65)-(6,68)
*)

(* type error slice
(3,13)-(3,14)
(3,13)-(3,16)
(4,40)-(4,46)
(4,40)-(4,57)
(4,47)-(4,57)
(4,48)-(4,49)
(6,21)-(6,27)
(6,21)-(6,75)
(6,28)-(6,75)
(6,53)-(6,74)
(6,54)-(6,70)
*)
