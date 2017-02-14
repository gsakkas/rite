
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
(6,30)-(6,67)
(6,38)-(6,41)
(6,38)-(6,43)
(6,42)-(6,43)
(6,49)-(6,50)
(6,49)-(6,62)
(6,49)-(6,67)
(6,54)-(6,55)
(6,54)-(6,62)
(6,56)-(6,57)
*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(4,42)-(4,48)
(4,42)-(4,55)
(4,50)-(4,51)
(4,50)-(4,55)
(6,22)-(6,28)
(6,22)-(6,67)
(6,30)-(6,67)
(6,38)-(6,41)
(6,38)-(6,43)
(6,42)-(6,43)
(6,49)-(6,62)
(6,49)-(6,67)
(6,54)-(6,55)
(6,54)-(6,57)
*)
