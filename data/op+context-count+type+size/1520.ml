
let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x y x y = (y, true) in ((func f b), b));;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(6,41)-(6,57)
(6,45)-(6,57)
(6,50)-(6,51)
(6,64)-(6,72)
(6,69)-(6,70)
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
(6,22)-(6,76)
(6,30)-(6,76)
(6,39)-(6,57)
(6,41)-(6,57)
(6,43)-(6,57)
(6,45)-(6,57)
(6,50)-(6,51)
(6,50)-(6,57)
(6,53)-(6,57)
(6,64)-(6,68)
(6,64)-(6,72)
(6,64)-(6,76)
(6,69)-(6,70)
(6,71)-(6,72)
(6,75)-(6,76)
*)
