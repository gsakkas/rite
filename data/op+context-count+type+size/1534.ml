
let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func f b), b));;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(6,60)-(6,68)
(6,65)-(6,66)
*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,11)-(3,12)
(4,42)-(4,48)
(4,42)-(4,55)
(4,50)-(4,51)
(4,50)-(4,55)
(4,53)-(4,55)
(6,22)-(6,28)
(6,22)-(6,72)
(6,30)-(6,72)
(6,39)-(6,53)
(6,41)-(6,53)
(6,46)-(6,47)
(6,46)-(6,53)
(6,49)-(6,53)
(6,60)-(6,64)
(6,60)-(6,68)
(6,60)-(6,72)
(6,65)-(6,66)
(6,67)-(6,68)
(6,71)-(6,72)
*)
