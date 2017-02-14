
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((f, (not ((f b) = b))) b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((fun x  -> ((f b), (3 < 4))), b);;

*)

(* changed spans
(5,31)-(5,32)
(5,31)-(5,54)
(5,35)-(5,38)
(5,35)-(5,49)
(5,41)-(5,44)
(5,41)-(5,49)
(5,48)-(5,49)
(5,53)-(5,54)
*)

(* type error slice
(5,31)-(5,49)
(5,31)-(5,54)
*)
