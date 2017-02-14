
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile (((f b) <> b), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) =
  let f x = let xx = f b in (xx, (xx <> b)) in wwhile (f, b);;

*)

(* changed spans
(5,21)-(5,27)
(5,21)-(5,45)
(5,28)-(5,45)
(5,29)-(5,41)
(5,30)-(5,35)
(5,39)-(5,40)
(5,43)-(5,44)
*)

(* type error slice
(3,16)-(3,17)
(3,16)-(3,19)
(3,50)-(3,56)
(3,50)-(3,64)
(3,57)-(3,64)
(3,58)-(3,59)
(5,21)-(5,27)
(5,21)-(5,45)
(5,28)-(5,45)
(5,29)-(5,41)
*)
