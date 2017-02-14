
let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) =
  wwhile (let func x y = (x, ((x y) <> y)) in ((func f b), b));;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(7,11)-(7,61)
(7,22)-(7,41)
(7,27)-(7,28)
(7,32)-(7,33)
(7,32)-(7,35)
(7,32)-(7,41)
(7,34)-(7,35)
(7,40)-(7,41)
(7,49)-(7,57)
(7,49)-(7,61)
(7,60)-(7,61)
*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(4,42)-(4,48)
(4,42)-(4,55)
(4,50)-(4,51)
(4,50)-(4,55)
(7,3)-(7,9)
(7,3)-(7,61)
(7,11)-(7,61)
(7,11)-(7,61)
(7,20)-(7,41)
(7,22)-(7,41)
(7,27)-(7,41)
(7,49)-(7,53)
(7,49)-(7,57)
(7,49)-(7,61)
*)
