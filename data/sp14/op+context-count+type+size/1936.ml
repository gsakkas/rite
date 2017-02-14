
let rec wwhile (f,b) =
  match f b with | (b',true ) -> wwhile (f, b') | (b',false ) -> b';;

let fixpoint (f,b) = wwhile (((f b), (b <> (f b))), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',true ) -> wwhile (f, b') | (b',false ) -> b';;

let fixpoint (f,b) =
  let f b = let b' = f b in (b', ((f b) <> b)) in wwhile (f, b);;

*)

(* changed spans
(5,21)-(5,27)
(5,21)-(5,54)
(5,28)-(5,54)
(5,29)-(5,50)
(5,30)-(5,35)
(5,37)-(5,49)
(5,38)-(5,39)
(5,43)-(5,48)
*)

(* type error slice
(3,8)-(3,9)
(3,8)-(3,11)
(3,33)-(3,39)
(3,33)-(3,47)
(3,40)-(3,47)
(3,41)-(3,42)
(5,21)-(5,27)
(5,21)-(5,54)
(5,28)-(5,54)
(5,29)-(5,50)
*)
