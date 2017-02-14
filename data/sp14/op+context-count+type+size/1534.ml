
let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let x = not f in ((x, ((f b) = b)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(6,28)-(6,68)
(6,37)-(6,40)
(6,37)-(6,42)
(6,41)-(6,42)
(6,46)-(6,67)
(6,47)-(6,63)
(6,48)-(6,49)
(6,51)-(6,62)
(6,53)-(6,54)
(6,55)-(6,56)
*)

(* type error slice
(3,8)-(3,9)
(3,8)-(3,11)
(4,41)-(4,47)
(4,41)-(4,55)
(4,48)-(4,55)
(4,49)-(4,50)
(6,21)-(6,27)
(6,21)-(6,68)
(6,28)-(6,68)
(6,37)-(6,40)
(6,37)-(6,42)
(6,41)-(6,42)
(6,46)-(6,67)
(6,47)-(6,63)
(6,52)-(6,57)
(6,53)-(6,54)
*)
