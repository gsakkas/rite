
let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

let fixpoint (f,b) = wwhile ((((b * b) * b), (b < 100)), b);;


(* fix

let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

let fixpoint (f,b) =
  wwhile ((let d x = let xx = f b in (xx, (xx = b)) in d), b);;

*)

(* changed spans
(6,33)-(6,34)
(6,33)-(6,38)
(6,33)-(6,43)
(6,33)-(6,54)
(6,37)-(6,38)
(6,42)-(6,43)
(6,47)-(6,48)
(6,47)-(6,54)
(6,51)-(6,54)
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
(6,22)-(6,59)
(6,33)-(6,34)
(6,33)-(6,38)
(6,33)-(6,43)
(6,33)-(6,54)
(6,33)-(6,59)
(6,47)-(6,54)
(6,58)-(6,59)
*)
