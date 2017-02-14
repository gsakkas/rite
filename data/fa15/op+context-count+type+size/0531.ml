
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (let func x = f in (f, (not ((f b) = b)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((fun x  -> ((f b), (3 < 4))), b);;

*)

(* changed spans
(5,30)-(5,72)
(5,43)-(5,44)
(5,49)-(5,50)
(5,49)-(5,72)
(5,53)-(5,56)
(5,53)-(5,67)
(5,59)-(5,67)
(5,66)-(5,67)
(5,71)-(5,72)
*)

(* type error slice
(3,50)-(3,56)
(3,50)-(3,62)
(3,58)-(3,62)
(5,22)-(5,28)
(5,22)-(5,72)
(5,30)-(5,72)
(5,49)-(5,72)
*)
