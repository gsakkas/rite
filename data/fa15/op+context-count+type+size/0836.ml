
let rec wwhile (f,b) =
  let pair = f b in
  let (b',c') = pair in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile (true, b);;


(* fix

let rec wwhile (f,b) =
  let pair = f b in
  let (b',c') = pair in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((fun x  -> ((f x), (x != (f x)))), b);;

*)

(* changed spans
(6,30)-(6,34)
(6,36)-(6,37)
*)

(* type error slice
(3,14)-(3,15)
(3,14)-(3,17)
(4,52)-(4,58)
(4,52)-(4,65)
(4,60)-(4,61)
(4,60)-(4,65)
(6,22)-(6,28)
(6,22)-(6,37)
(6,30)-(6,34)
(6,30)-(6,37)
*)
