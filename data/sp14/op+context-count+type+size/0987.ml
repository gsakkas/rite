
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
(6,12)-(6,54)
(6,18)-(6,19)
(6,23)-(6,24)
(6,31)-(6,32)
(6,31)-(6,38)
(6,46)-(6,47)
*)

(* type error slice
(3,17)-(3,18)
(3,17)-(3,20)
(3,42)-(3,48)
(3,42)-(3,55)
(3,50)-(3,51)
(3,50)-(3,55)
(6,3)-(6,72)
(6,12)-(6,54)
(6,31)-(6,38)
(6,59)-(6,65)
(6,59)-(6,72)
(6,67)-(6,69)
(6,67)-(6,72)
*)
