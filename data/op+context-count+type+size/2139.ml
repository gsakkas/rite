
let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (let h = f in ((h, false), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (let h x = ((f x), false) in (h, b));;

*)

(* changed spans
(5,38)-(5,39)
(5,45)-(5,46)
(5,45)-(5,57)
(5,48)-(5,53)
(5,56)-(5,57)
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
(5,22)-(5,57)
(5,30)-(5,57)
(5,38)-(5,39)
(5,45)-(5,46)
(5,45)-(5,53)
(5,45)-(5,57)
(5,48)-(5,53)
(5,56)-(5,57)
*)
