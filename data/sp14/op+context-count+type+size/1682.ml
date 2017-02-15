
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
(5,21)-(5,27)
(5,21)-(5,65)
(5,28)-(5,65)
(5,32)-(5,37)
(5,32)-(5,41)
(5,40)-(5,41)
(5,47)-(5,48)
(5,55)-(5,60)
(5,56)-(5,57)
(5,62)-(5,63)
*)

(* type error slice
(5,28)-(5,65)
(5,28)-(5,65)
(5,47)-(5,48)
(5,54)-(5,64)
(5,62)-(5,63)
*)
