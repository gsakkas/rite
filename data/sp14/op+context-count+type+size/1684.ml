
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
(6,55)-(6,60)
(6,62)-(6,63)
*)

(* type error slice
(3,16)-(3,17)
(3,16)-(3,19)
(3,50)-(3,56)
(3,50)-(3,64)
(3,57)-(3,64)
(3,58)-(3,59)
(6,2)-(6,64)
(6,8)-(6,43)
(6,12)-(6,43)
(6,28)-(6,43)
(6,47)-(6,53)
(6,47)-(6,64)
(6,54)-(6,64)
(6,55)-(6,60)
(6,56)-(6,57)
*)
