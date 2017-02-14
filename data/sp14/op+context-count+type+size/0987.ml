
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let f' = if (f b) = b then (b, true) else (b, false) in wwhile (f', b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let f' b' = if (f b') = b' then (b', true) else (b', false) in
  wwhile (f', b);;

*)

(* changed spans
(6,11)-(6,54)
(6,17)-(6,18)
(6,22)-(6,23)
(6,29)-(6,38)
(6,30)-(6,31)
(6,45)-(6,46)
*)

(* type error slice
(3,16)-(3,17)
(3,16)-(3,19)
(3,41)-(3,47)
(3,41)-(3,55)
(3,48)-(3,55)
(3,49)-(3,50)
(6,2)-(6,72)
(6,11)-(6,54)
(6,29)-(6,38)
(6,58)-(6,64)
(6,58)-(6,72)
(6,65)-(6,72)
(6,66)-(6,68)
*)
