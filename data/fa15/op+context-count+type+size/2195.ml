
let intboolf f x = ((f x), ((f x) < 1));;

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
(2,14)-(2,38)
(2,16)-(2,38)
(2,22)-(2,38)
(2,24)-(2,25)
(2,30)-(2,33)
(2,30)-(2,38)
(2,32)-(2,33)
(2,37)-(2,38)
(4,17)-(5,64)
(7,30)-(7,38)
(7,40)-(7,41)
*)

(* type error slice
(2,4)-(2,42)
(2,14)-(2,38)
(2,16)-(2,38)
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
