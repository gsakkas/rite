
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
(5,21)-(5,27)
(5,21)-(5,48)
(5,28)-(5,48)
(5,29)-(5,44)
(5,30)-(5,36)
(5,37)-(5,43)
(5,46)-(5,47)
*)

(* type error slice
(3,2)-(3,64)
(3,16)-(3,17)
(3,16)-(3,19)
(3,23)-(3,64)
(3,23)-(3,64)
(3,42)-(3,44)
(3,50)-(3,56)
(3,50)-(3,64)
(3,57)-(3,64)
(3,58)-(3,59)
(5,21)-(5,27)
(5,21)-(5,48)
(5,28)-(5,48)
(5,29)-(5,44)
(5,30)-(5,36)
*)
