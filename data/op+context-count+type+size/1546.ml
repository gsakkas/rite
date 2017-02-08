
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
(6,32)-(6,35)
(6,32)-(6,37)
(6,32)-(6,40)
(6,32)-(6,44)
(6,36)-(6,37)
(6,43)-(6,44)
*)

(* type error slice
(6,32)-(6,35)
(6,32)-(6,37)
(6,32)-(6,40)
*)
