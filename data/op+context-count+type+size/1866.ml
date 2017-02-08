
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((wwhile (f, b)), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) =
  let f x = let xx = f b in (xx, (xx <> b)) in wwhile (f, b);;

*)

(* changed spans
(5,22)-(5,28)
(5,22)-(5,48)
(5,31)-(5,37)
(5,31)-(5,43)
(5,31)-(5,48)
(5,39)-(5,43)
(5,47)-(5,48)
*)

(* type error slice
(3,3)-(3,64)
(3,17)-(3,18)
(3,17)-(3,20)
(3,24)-(3,64)
(3,24)-(3,64)
(3,43)-(3,45)
(3,51)-(3,57)
(3,51)-(3,64)
(3,59)-(3,60)
(3,59)-(3,64)
(5,22)-(5,28)
(5,22)-(5,48)
(5,31)-(5,37)
(5,31)-(5,43)
(5,31)-(5,48)
*)
