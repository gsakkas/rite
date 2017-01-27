
let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (b, b);;


(* fix

let h x = ((x * x), (x < 100));;

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (h, b);;

*)

(* changed spans
(2,17)-(3,62)
(5,22)-(5,28)
(5,22)-(5,34)
(5,30)-(5,31)
(5,30)-(5,34)
(5,33)-(5,34)
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
(5,22)-(5,34)
(5,30)-(5,31)
(5,30)-(5,34)
(5,33)-(5,34)
*)
