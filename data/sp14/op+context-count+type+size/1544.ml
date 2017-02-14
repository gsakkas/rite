
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
(6,58)-(6,68)
(6,64)-(6,65)
*)

(* type error slice
(3,8)-(3,9)
(3,8)-(3,11)
(4,41)-(4,47)
(4,41)-(4,55)
(4,48)-(4,55)
(4,49)-(4,50)
(6,21)-(6,27)
(6,21)-(6,73)
(6,28)-(6,73)
(6,28)-(6,73)
(6,38)-(6,53)
(6,40)-(6,53)
(6,44)-(6,53)
(6,57)-(6,72)
(6,58)-(6,68)
(6,59)-(6,63)
*)
