
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let f1 f2 x = if (f2 x) = x then false else true in wwhile ((f1 f), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let f1 f2 x = if (f2 x) = x then (false, x) else (true, (f2 x)) in
  wwhile ((f1 f), b);;

*)

(* changed spans
(6,35)-(6,40)
(6,46)-(6,50)
(6,54)-(6,60)
(6,62)-(6,68)
(6,63)-(6,65)
(6,66)-(6,67)
(6,70)-(6,71)
*)

(* type error slice
(3,2)-(3,63)
(3,16)-(3,17)
(3,16)-(3,19)
(3,41)-(3,47)
(3,41)-(3,55)
(3,48)-(3,55)
(3,49)-(3,50)
(6,2)-(6,72)
(6,9)-(6,50)
(6,12)-(6,50)
(6,16)-(6,50)
(6,35)-(6,40)
(6,54)-(6,60)
(6,54)-(6,72)
(6,61)-(6,72)
(6,62)-(6,68)
(6,63)-(6,65)
*)
