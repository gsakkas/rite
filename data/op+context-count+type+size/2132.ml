
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
(2,17)-(3,62)
(5,30)-(5,67)
(5,36)-(5,49)
(5,41)-(5,42)
(5,44)-(5,49)
(5,56)-(5,57)
(5,56)-(5,62)
(5,56)-(5,67)
(5,59)-(5,60)
(5,59)-(5,62)
(5,61)-(5,62)
*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,50)-(3,56)
(3,50)-(3,62)
(3,58)-(3,59)
(3,58)-(3,62)
(5,22)-(5,28)
(5,22)-(5,67)
(5,30)-(5,67)
(5,30)-(5,67)
(5,36)-(5,49)
(5,41)-(5,49)
(5,56)-(5,57)
(5,56)-(5,62)
(5,56)-(5,67)
*)
