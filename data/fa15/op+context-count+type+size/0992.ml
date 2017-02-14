
let rec wwhile (f,b) =
  match f b with | (b',c) -> if c = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((let b = f b in (b, (b != b))), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c) -> if c = true then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile ((fun fixb  -> let b = f b in (b, (fixb != b))), b);;

*)

(* changed spans
(5,31)-(5,57)
(5,39)-(5,42)
(5,51)-(5,52)
*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,47)-(3,53)
(3,47)-(3,60)
(3,55)-(3,56)
(3,55)-(3,60)
(5,22)-(5,28)
(5,22)-(5,63)
(5,31)-(5,57)
(5,31)-(5,63)
(5,47)-(5,57)
*)
