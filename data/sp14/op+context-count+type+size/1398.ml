
let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (((not f) b), b);;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(6,28)-(6,44)
(6,29)-(6,40)
(6,30)-(6,37)
(6,31)-(6,34)
(6,35)-(6,36)
(6,42)-(6,43)
*)

(* type error slice
(6,29)-(6,40)
(6,30)-(6,37)
(6,31)-(6,34)
*)
