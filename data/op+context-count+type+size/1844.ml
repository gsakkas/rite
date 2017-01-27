
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile (if (f b) = b then b else ((f b), b));;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) =
  let f x = let xx = f b in (xx, (xx <> b)) in wwhile (f, b);;

*)

(* changed spans
(5,22)-(5,28)
(5,22)-(5,64)
(5,30)-(5,64)
(5,34)-(5,37)
(5,34)-(5,42)
(5,41)-(5,42)
(5,48)-(5,49)
(5,57)-(5,58)
(5,57)-(5,60)
(5,63)-(5,64)
*)

(* type error slice
(5,30)-(5,64)
(5,34)-(5,35)
(5,34)-(5,37)
(5,36)-(5,37)
(5,48)-(5,49)
(5,57)-(5,58)
(5,57)-(5,60)
(5,57)-(5,64)
(5,59)-(5,60)
(5,63)-(5,64)
*)
