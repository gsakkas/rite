
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((fun x  -> ((f x), ((not f b) = b))), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((fun x  -> ((f x), (not ((f b) = b)))), b);;

*)

(* changed spans
(5,48)-(5,63)
(5,49)-(5,58)
(5,54)-(5,55)
*)

(* type error slice
(5,49)-(5,58)
(5,50)-(5,53)
*)
