
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((let f2 x = f x in (f, false)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((fun x  -> ((f b), (3 < 4))), b);;

*)

(* changed spans
(5,31)-(5,58)
(5,42)-(5,43)
(5,42)-(5,45)
(5,44)-(5,45)
(5,50)-(5,51)
(5,53)-(5,58)
*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,50)-(3,56)
(3,50)-(3,62)
(3,58)-(3,59)
(3,58)-(3,62)
(5,22)-(5,28)
(5,22)-(5,63)
(5,31)-(5,58)
(5,31)-(5,63)
(5,50)-(5,58)
*)
