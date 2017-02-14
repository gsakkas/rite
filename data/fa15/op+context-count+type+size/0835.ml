
let rec wwhile (f,b) =
  let pair = f b in
  let (b',c') = pair in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile (f, (b, (b != (f b))));;


(* fix

let rec wwhile (f,b) =
  let pair = f b in
  let (b',c') = pair in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((fun x  -> ((f x), (x != (f x)))), b);;

*)

(* changed spans
(6,30)-(6,31)
(6,34)-(6,35)
(6,38)-(6,39)
(6,38)-(6,47)
(6,46)-(6,47)
*)

(* type error slice
(3,3)-(4,65)
(3,14)-(3,15)
(3,14)-(3,17)
(4,3)-(4,65)
(4,17)-(4,21)
(4,52)-(4,58)
(4,52)-(4,65)
(4,60)-(4,61)
(4,60)-(4,65)
(4,63)-(4,65)
(6,22)-(6,28)
(6,22)-(6,47)
(6,30)-(6,31)
(6,30)-(6,47)
(6,34)-(6,35)
(6,34)-(6,47)
(6,38)-(6,39)
(6,38)-(6,47)
(6,38)-(6,47)
(6,44)-(6,45)
(6,44)-(6,47)
*)
