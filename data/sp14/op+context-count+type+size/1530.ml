
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
(6,40)-(6,57)
(6,44)-(6,57)
(6,49)-(6,50)
(6,62)-(6,72)
(6,68)-(6,69)
*)

(* type error slice
(3,2)-(4,71)
(3,8)-(3,9)
(3,8)-(3,11)
(4,41)-(4,47)
(4,41)-(4,55)
(4,48)-(4,55)
(4,49)-(4,50)
(6,21)-(6,27)
(6,21)-(6,77)
(6,28)-(6,77)
(6,28)-(6,77)
(6,38)-(6,57)
(6,40)-(6,57)
(6,42)-(6,57)
(6,44)-(6,57)
(6,61)-(6,76)
(6,62)-(6,72)
(6,63)-(6,67)
*)
