
let rec wwhile (f,b) =
  let pair = f b in
  let (b',c') = pair in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((f, (f == b)), b);;


(* fix

let rec wwhile (f,b) =
  let pair = f b in
  let (b',c') = pair in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((fun x  -> ((f x), (x != (f x)))), b);;

*)

(* changed spans
(6,29)-(6,42)
(6,30)-(6,31)
(6,33)-(6,41)
(6,39)-(6,40)
(6,44)-(6,45)
*)

(* type error slice
(3,13)-(3,14)
(3,13)-(3,16)
(4,51)-(4,57)
(4,51)-(4,65)
(4,58)-(4,65)
(4,59)-(4,60)
(6,21)-(6,27)
(6,21)-(6,46)
(6,28)-(6,46)
(6,29)-(6,42)
*)
