
let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile ((f, ((f b) <> b)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(6,31)-(6,32)
(6,31)-(6,45)
(6,31)-(6,50)
(6,36)-(6,37)
(6,36)-(6,45)
(6,38)-(6,39)
*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(4,42)-(4,48)
(4,42)-(4,55)
(4,50)-(4,51)
(4,50)-(4,55)
(6,22)-(6,28)
(6,22)-(6,50)
(6,31)-(6,45)
(6,31)-(6,50)
*)
