
let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) =
  wwhile (let func x x = ((f b), ((f b) = b)) in (func, b));;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x = ((f x), ((f x) = x)) in (func, b));;

*)

(* changed spans
(7,29)-(7,30)
x
VarG

(7,42)-(7,43)
x
VarG

(7,49)-(7,58)
x
VarG

*)
