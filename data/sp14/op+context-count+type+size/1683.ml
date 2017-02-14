
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (if (f b) = b then (b, b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) =
  wwhile ((let f x = let xx = (x * x) * x in (xx, (xx < 100)) in f), b);;

*)

(* changed spans
(5,30)-(5,53)
(5,34)-(5,35)
(5,34)-(5,37)
(5,34)-(5,42)
(5,36)-(5,37)
(5,41)-(5,42)
(5,49)-(5,50)
(5,52)-(5,53)
*)

(* type error slice
(3,3)-(3,62)
(3,9)-(3,10)
(3,9)-(3,12)
(3,50)-(3,56)
(3,50)-(3,62)
(3,58)-(3,59)
(3,58)-(3,62)
(3,61)-(3,62)
(5,22)-(5,28)
(5,22)-(5,53)
(5,30)-(5,53)
(5,30)-(5,53)
(5,30)-(5,53)
(5,49)-(5,50)
(5,49)-(5,53)
(5,52)-(5,53)
*)
