
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
(6,56)-(6,61)
f
VarG

*)

(* type error slice
(3,17)-(3,18)
(3,17)-(3,20)
(3,51)-(3,57)
(3,51)-(3,65)
(3,58)-(3,65)
(3,59)-(3,60)
(6,3)-(6,65)
(6,9)-(6,44)
(6,13)-(6,44)
(6,29)-(6,44)
(6,48)-(6,54)
(6,48)-(6,65)
(6,55)-(6,65)
(6,56)-(6,61)
(6,57)-(6,58)
*)
