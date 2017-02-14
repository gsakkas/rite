
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((f, true), b);;


(* fix

let func (f,b) b = ((f b), ((f b) == b));;

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((func (f, b)), b);;

*)

(* changed spans
(3,3)-(3,64)
(5,22)-(5,28)
(5,22)-(5,42)
(5,31)-(5,32)
(5,31)-(5,38)
(5,31)-(5,42)
(5,34)-(5,38)
(5,41)-(5,42)
*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,42)-(3,48)
(3,42)-(3,55)
(3,50)-(3,51)
(3,50)-(3,55)
(5,22)-(5,28)
(5,22)-(5,42)
(5,31)-(5,38)
(5,31)-(5,42)
*)
