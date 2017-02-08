
let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((b, false), b);;


(* fix

let h x = ((x * x), (x < 100));;

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (h, b);;

*)

(* changed spans
(2,17)-(3,62)
(5,22)-(5,28)
(5,22)-(5,43)
(5,31)-(5,32)
(5,31)-(5,39)
(5,31)-(5,43)
(5,34)-(5,39)
(5,42)-(5,43)
*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,50)-(3,56)
(3,50)-(3,62)
(3,58)-(3,59)
(3,58)-(3,62)
(5,22)-(5,28)
(5,22)-(5,43)
(5,31)-(5,39)
(5,31)-(5,43)
*)
