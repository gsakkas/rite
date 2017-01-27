
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
(5,22)-(5,28)
(5,22)-(5,45)
(5,32)-(5,35)
(5,32)-(5,41)
(5,32)-(5,45)
(5,40)-(5,41)
(5,44)-(5,45)
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
(5,22)-(5,28)
(5,22)-(5,45)
(5,32)-(5,41)
(5,32)-(5,45)
(5,44)-(5,45)
*)
