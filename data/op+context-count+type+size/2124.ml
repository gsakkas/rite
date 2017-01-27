
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
(2,17)-(3,62)
(5,30)-(5,67)
(5,36)-(5,41)
(5,40)-(5,41)
(5,48)-(5,49)
(5,48)-(5,54)
(5,48)-(5,63)
(5,51)-(5,52)
(5,51)-(5,54)
(5,53)-(5,54)
(5,58)-(5,63)
*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,11)-(3,12)
(3,50)-(3,56)
(3,50)-(3,62)
(3,58)-(3,59)
(3,58)-(3,62)
(3,61)-(3,62)
(5,22)-(5,28)
(5,22)-(5,67)
(5,30)-(5,67)
(5,48)-(5,63)
(5,48)-(5,67)
(5,58)-(5,63)
(5,66)-(5,67)
*)
