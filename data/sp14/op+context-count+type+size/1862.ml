
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
(6,2)-(6,8)
(6,2)-(6,62)
(6,9)-(6,62)
(6,19)-(6,22)
(6,26)-(6,61)
(6,29)-(6,31)
(6,29)-(6,35)
(6,34)-(6,35)
(6,41)-(6,42)
(6,43)-(6,44)
(6,51)-(6,57)
(6,54)-(6,56)
*)

(* type error slice
(6,26)-(6,61)
(6,26)-(6,61)
(6,41)-(6,42)
(6,41)-(6,44)
(6,50)-(6,61)
(6,51)-(6,57)
(6,52)-(6,53)
*)
