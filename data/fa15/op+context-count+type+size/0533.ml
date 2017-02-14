
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((fun x  -> ((f x), ((not f b) = b))), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((fun x  -> ((f x), (not ((f b) = b)))), b);;

*)

(* changed spans
(5,51)-(5,58)
(5,51)-(5,63)
(5,55)-(5,56)
*)

(* type error slice
(5,51)-(5,54)
(5,51)-(5,58)
*)
