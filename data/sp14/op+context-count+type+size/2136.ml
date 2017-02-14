
let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (let g x = x in (((g (f b)), false), b));;


(* fix

let h x = ((x * x), (x < 100));;

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (h, b);;

*)

(* changed spans
(2,16)-(3,62)
(5,28)-(5,68)
(5,35)-(5,40)
(5,39)-(5,40)
(5,45)-(5,63)
(5,46)-(5,55)
(5,47)-(5,48)
(5,49)-(5,54)
(5,50)-(5,51)
(5,52)-(5,53)
(5,57)-(5,62)
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
(5,44)-(5,67)
(5,45)-(5,63)
*)
