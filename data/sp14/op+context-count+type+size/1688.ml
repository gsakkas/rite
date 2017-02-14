
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((f (if (f b) = b then b)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) =
  wwhile ((let f x = let xx = (x * x) * x in (xx, (xx < 100)) in f), b);;

*)

(* changed spans
(5,29)-(5,54)
(5,30)-(5,31)
(5,32)-(5,53)
(5,33)-(5,52)
(5,36)-(5,41)
(5,36)-(5,45)
(5,37)-(5,38)
(5,44)-(5,45)
(5,51)-(5,52)
(5,56)-(5,57)
*)

(* type error slice
(3,8)-(3,9)
(3,8)-(3,11)
(3,49)-(3,55)
(3,49)-(3,62)
(3,56)-(3,62)
(3,57)-(3,58)
(5,21)-(5,27)
(5,21)-(5,58)
(5,28)-(5,58)
(5,29)-(5,54)
(5,30)-(5,31)
(5,32)-(5,53)
(5,33)-(5,52)
(5,36)-(5,41)
(5,36)-(5,45)
(5,36)-(5,45)
(5,37)-(5,38)
(5,39)-(5,40)
(5,44)-(5,45)
*)
