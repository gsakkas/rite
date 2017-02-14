
let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

let fixpoint (f,b) = wwhile (let xx = f b in ((xx, (xx = b)), b));;


(* fix

let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

let fixpoint (f,b) =
  wwhile ((let d x = let xx = f b in (xx, (xx = b)) in d), b);;

*)

(* changed spans
(6,28)-(6,65)
(6,38)-(6,41)
(6,46)-(6,60)
(6,62)-(6,63)
*)

(* type error slice
(3,13)-(3,14)
(3,13)-(3,16)
(4,40)-(4,46)
(4,40)-(4,57)
(4,47)-(4,57)
(4,48)-(4,49)
(6,21)-(6,27)
(6,21)-(6,65)
(6,28)-(6,65)
(6,45)-(6,64)
(6,46)-(6,60)
*)
