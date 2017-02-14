
let intboolf f b = ((f b), ((f b) == 0));;

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (intboolf, b);;


(* fix

let func (f,b) b = ((f b), ((f b) == b));;

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((func (f, b)), b);;

*)

(* changed spans
(2,14)-(2,39)
(2,38)-(2,39)
(7,30)-(7,38)
(7,40)-(7,41)
*)

(* type error slice
(2,4)-(2,43)
(2,14)-(2,39)
(2,16)-(2,39)
(5,3)-(5,64)
(5,9)-(5,10)
(5,9)-(5,12)
(5,42)-(5,48)
(5,42)-(5,55)
(5,50)-(5,51)
(5,50)-(5,55)
(7,22)-(7,28)
(7,22)-(7,41)
(7,30)-(7,38)
(7,30)-(7,41)
*)
