
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((if (f b) = b then b), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) =
  wwhile ((let f x = let xx = (x * x) * x in (xx, (xx < 100)) in f), b);;

*)

(* changed spans
(5,31)-(5,50)
(5,35)-(5,36)
(5,35)-(5,38)
(5,35)-(5,43)
(5,42)-(5,43)
(5,49)-(5,50)
(5,53)-(5,54)
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
(5,22)-(5,54)
(5,31)-(5,50)
(5,31)-(5,54)
(5,49)-(5,50)
(5,53)-(5,54)
*)
