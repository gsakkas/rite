
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
(6,59)-(6,69)
func b
AppG [VarG]

*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(4,42)-(4,48)
(4,42)-(4,56)
(4,49)-(4,56)
(4,50)-(4,51)
(6,22)-(6,28)
(6,22)-(6,74)
(6,29)-(6,74)
(6,39)-(6,54)
(6,41)-(6,54)
(6,45)-(6,54)
(6,58)-(6,73)
(6,59)-(6,69)
(6,60)-(6,64)
*)
