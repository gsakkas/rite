
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
(2,13)-(2,40)
(2,37)-(2,38)
(7,29)-(7,37)
(7,39)-(7,40)
*)

(* type error slice
(2,3)-(2,42)
(2,13)-(2,40)
(2,15)-(2,40)
(5,2)-(5,63)
(5,8)-(5,9)
(5,8)-(5,11)
(5,41)-(5,47)
(5,41)-(5,55)
(5,48)-(5,55)
(5,49)-(5,50)
(7,21)-(7,27)
(7,21)-(7,41)
(7,28)-(7,41)
(7,29)-(7,37)
*)
