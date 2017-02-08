
let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (let h x y = ((y x), false) in ((h b f), b));;


(* fix

let h x = ((x * x), (x < 100));;

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (h, b);;

*)

(* changed spans
(2,17)-(3,62)
(5,30)-(5,71)
(5,36)-(5,55)
(5,38)-(5,55)
(5,44)-(5,45)
(5,44)-(5,47)
(5,46)-(5,47)
(5,50)-(5,55)
(5,62)-(5,67)
(5,62)-(5,71)
(5,66)-(5,67)
(5,70)-(5,71)
*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,50)-(3,56)
(3,50)-(3,62)
(3,58)-(3,59)
(3,58)-(3,62)
(5,22)-(5,28)
(5,22)-(5,71)
(5,30)-(5,71)
(5,30)-(5,71)
(5,36)-(5,55)
(5,38)-(5,55)
(5,44)-(5,55)
(5,62)-(5,63)
(5,62)-(5,67)
(5,62)-(5,71)
*)
