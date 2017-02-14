
let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (((f b) <> b), b);;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(6,32)-(6,33)
(6,32)-(6,35)
(6,32)-(6,41)
(6,32)-(6,45)
(6,40)-(6,41)
(6,44)-(6,45)
*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(4,42)-(4,48)
(4,42)-(4,55)
(4,50)-(4,51)
(4,50)-(4,55)
(6,22)-(6,28)
(6,22)-(6,45)
(6,32)-(6,41)
(6,32)-(6,45)
*)
