
let rec wwhile (f,b) =
  let pair = f b in
  let (b',c') = pair in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile (f, true, b);;


(* fix

let rec wwhile (f,b) =
  let pair = f b in
  let (b',c') = pair in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((fun x  -> ((f x), (x != (f x)))), b);;

*)

(* changed spans
(6,28)-(6,40)
(6,29)-(6,30)
(6,32)-(6,36)
(6,38)-(6,39)
*)

(* type error slice
(4,51)-(4,57)
(4,51)-(4,65)
(4,58)-(4,65)
(6,21)-(6,27)
(6,21)-(6,40)
(6,28)-(6,40)
*)
