
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((fun x  -> x), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) =
  wwhile ((let f x = let xx = (x * x) * x in (xx, (xx < 100)) in f), b);;

*)

(* changed spans
(5,31)-(5,42)
(5,41)-(5,42)
(5,45)-(5,46)
*)

(* type error slice
(2,4)-(3,65)
(2,17)-(3,62)
(3,3)-(3,62)
(3,9)-(3,10)
(3,9)-(3,12)
(3,11)-(3,12)
(3,50)-(3,56)
(3,50)-(3,62)
(3,58)-(3,62)
(3,61)-(3,62)
(5,22)-(5,28)
(5,22)-(5,46)
(5,31)-(5,42)
(5,31)-(5,46)
(5,41)-(5,42)
*)
