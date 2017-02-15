
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
(7,9)-(7,62)
(7,21)-(7,42)
(7,26)-(7,27)
(7,29)-(7,41)
(7,30)-(7,35)
(7,31)-(7,32)
(7,33)-(7,34)
(7,39)-(7,40)
(7,46)-(7,61)
(7,47)-(7,57)
(7,48)-(7,52)
(7,53)-(7,54)
*)

(* type error slice
(3,8)-(3,9)
(3,8)-(3,11)
(4,41)-(4,47)
(4,41)-(4,55)
(4,48)-(4,55)
(4,49)-(4,50)
(7,2)-(7,8)
(7,2)-(7,62)
(7,9)-(7,62)
(7,9)-(7,62)
(7,19)-(7,42)
(7,21)-(7,42)
(7,25)-(7,42)
(7,46)-(7,61)
(7,47)-(7,57)
(7,48)-(7,52)
*)
