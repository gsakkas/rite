
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
(6,30)-(6,64)
(6,39)-(6,42)
(6,48)-(6,59)
(6,63)-(6,64)
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
(6,22)-(6,64)
(6,30)-(6,64)
(6,48)-(6,50)
(6,48)-(6,59)
(6,48)-(6,64)
(6,53)-(6,59)
(6,63)-(6,64)
*)
