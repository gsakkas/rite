
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (let func x = f in (f, (not ((f b) = b)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((fun x  -> ((f b), (3 < 4))), b);;

*)

(* changed spans
(5,28)-(5,73)
(5,42)-(5,43)
(5,47)-(5,72)
(5,48)-(5,49)
(5,51)-(5,68)
(5,52)-(5,55)
(5,56)-(5,67)
(5,65)-(5,66)
(5,70)-(5,71)
*)

(* type error slice
(3,49)-(3,55)
(3,49)-(3,62)
(3,56)-(3,62)
(5,21)-(5,27)
(5,21)-(5,73)
(5,28)-(5,73)
(5,47)-(5,72)
*)
