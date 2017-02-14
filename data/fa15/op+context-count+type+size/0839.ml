
let rec wwhile (f,b) =
  let pair = f b in
  let (b',c') = pair in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((f, (b != (f b))), b);;


(* fix

let rec wwhile (f,b) =
  let pair = f b in
  let (b',c') = pair in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((fun x  -> ((f x), (x != (f x)))), b);;

*)

(* changed spans
(6,31)-(6,32)
(6,31)-(6,44)
(6,35)-(6,36)
(6,35)-(6,44)
(6,43)-(6,44)
*)

(* type error slice
(3,14)-(3,15)
(3,14)-(3,17)
(4,52)-(4,58)
(4,52)-(4,65)
(4,60)-(4,61)
(4,60)-(4,65)
(6,22)-(6,28)
(6,22)-(6,50)
(6,31)-(6,44)
(6,31)-(6,50)
*)
