
let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (let g x = (x, false) in ((g (f b)), b));;


(* fix

let h x = ((x * x), (x < 100));;

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (h, b);;

*)

(* changed spans
(2,16)-(3,62)
(5,28)-(5,68)
(5,35)-(5,49)
(5,40)-(5,41)
(5,43)-(5,48)
(5,53)-(5,67)
(5,54)-(5,63)
(5,55)-(5,56)
(5,57)-(5,62)
(5,58)-(5,59)
(5,60)-(5,61)
*)

(* type error slice
(3,8)-(3,9)
(3,8)-(3,11)
(3,49)-(3,55)
(3,49)-(3,62)
(3,56)-(3,62)
(3,57)-(3,58)
(5,21)-(5,27)
(5,21)-(5,68)
(5,28)-(5,68)
(5,28)-(5,68)
(5,35)-(5,49)
(5,39)-(5,49)
(5,53)-(5,67)
(5,54)-(5,63)
(5,55)-(5,56)
*)
