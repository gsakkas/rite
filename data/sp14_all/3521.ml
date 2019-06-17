
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
(7,22)-(7,46)
(f x , f x = x)
TupleG [AppG [EmptyG],BopG EmptyG EmptyG]

*)

(* type error slice
(3,3)-(4,72)
(3,9)-(3,10)
(3,9)-(3,12)
(4,42)-(4,48)
(4,42)-(4,56)
(4,49)-(4,56)
(4,50)-(4,51)
(7,3)-(7,9)
(7,3)-(7,60)
(7,10)-(7,60)
(7,20)-(7,46)
(7,22)-(7,46)
(7,50)-(7,59)
(7,51)-(7,55)
*)
