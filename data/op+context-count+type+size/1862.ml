
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) =
  wwhile (let b' = f b in if b' = b then f b else ((f b'), b));;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) =
  let f x = let xx = f b in (xx, (xx <> b)) in wwhile (f, b);;

*)

(* changed spans
(6,3)-(6,9)
(6,3)-(6,61)
(6,11)-(6,61)
(6,20)-(6,23)
(6,27)-(6,61)
(6,30)-(6,32)
(6,30)-(6,36)
(6,35)-(6,36)
(6,42)-(6,43)
(6,44)-(6,45)
(6,53)-(6,57)
(6,55)-(6,57)
*)

(* type error slice
(6,27)-(6,61)
(6,27)-(6,61)
(6,42)-(6,43)
(6,42)-(6,45)
(6,53)-(6,54)
(6,53)-(6,57)
(6,53)-(6,61)
*)
