
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((f, (f < 100)), b);;


(* fix

let func (f,b) b = ((f b), ((f b) == b));;

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((func (f, b)), b);;

*)

(* changed spans
(3,2)-(3,63)
(5,21)-(5,27)
(5,21)-(5,47)
(5,28)-(5,47)
(5,29)-(5,43)
(5,30)-(5,31)
(5,33)-(5,42)
(5,34)-(5,35)
(5,38)-(5,41)
(5,45)-(5,46)
*)

(* type error slice
(3,8)-(3,9)
(3,8)-(3,11)
(3,41)-(3,47)
(3,41)-(3,55)
(3,48)-(3,55)
(3,49)-(3,50)
(5,21)-(5,27)
(5,21)-(5,47)
(5,28)-(5,47)
(5,29)-(5,43)
*)
