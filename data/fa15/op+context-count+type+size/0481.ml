
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((f, (not ((f b) = b))) b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((fun x  -> ((f b), (3 < 4))), b);;

*)

(* changed spans
(5,28)-(5,54)
(5,30)-(5,31)
(5,33)-(5,50)
(5,34)-(5,37)
(5,38)-(5,49)
(5,39)-(5,44)
(5,47)-(5,48)
(5,52)-(5,53)
*)

(* type error slice
(5,28)-(5,54)
(5,29)-(5,51)
*)
