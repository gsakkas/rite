
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((f (if (f b) = b then 1 else 0)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) =
  wwhile ((let f x = let xx = (x * x) * x in (xx, (xx < 100)) in f), b);;

*)

(* changed spans
(5,31)-(5,32)
(5,31)-(5,60)
(5,34)-(5,60)
(5,38)-(5,39)
(5,38)-(5,41)
(5,38)-(5,46)
(5,45)-(5,46)
(5,52)-(5,53)
(5,59)-(5,60)
(5,64)-(5,65)
*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,50)-(3,56)
(3,50)-(3,62)
(3,58)-(3,59)
(3,58)-(3,62)
(5,22)-(5,28)
(5,22)-(5,65)
(5,31)-(5,32)
(5,31)-(5,60)
(5,31)-(5,65)
(5,34)-(5,60)
(5,38)-(5,39)
(5,38)-(5,41)
(5,38)-(5,46)
(5,38)-(5,46)
(5,40)-(5,41)
(5,45)-(5,46)
(5,52)-(5,53)
*)
