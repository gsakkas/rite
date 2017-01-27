
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) =
  let f x = let xx = f b in (xx, (xx <> b)) in wwhile ((f b), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) =
  let f x = let xx = f b in (xx, (xx <> b)) in wwhile (f, b);;

*)

(* changed spans
(6,57)-(6,60)
(6,63)-(6,64)
*)

(* type error slice
(3,17)-(3,18)
(3,17)-(3,20)
(3,19)-(3,20)
(3,51)-(3,57)
(3,51)-(3,64)
(3,59)-(3,60)
(3,59)-(3,64)
(3,62)-(3,64)
(6,3)-(6,64)
(6,9)-(6,42)
(6,13)-(6,42)
(6,30)-(6,32)
(6,30)-(6,42)
(6,35)-(6,42)
(6,48)-(6,54)
(6,48)-(6,64)
(6,57)-(6,58)
(6,57)-(6,60)
(6,57)-(6,64)
(6,59)-(6,60)
(6,63)-(6,64)
*)
