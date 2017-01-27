
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
(6,32)-(6,35)
(6,32)-(6,43)
(6,38)-(6,43)
(6,46)-(6,47)
*)

(* type error slice
(3,14)-(3,15)
(3,14)-(3,17)
(3,16)-(3,17)
(4,41)-(4,47)
(4,41)-(4,57)
(4,49)-(4,50)
(4,49)-(4,57)
(4,52)-(4,57)
(6,22)-(6,28)
(6,22)-(6,47)
(6,32)-(6,43)
(6,32)-(6,47)
(6,38)-(6,43)
(6,46)-(6,47)
*)
