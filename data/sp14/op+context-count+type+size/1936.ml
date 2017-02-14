
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
(5,22)-(5,28)
(5,22)-(5,54)
(5,32)-(5,35)
(5,32)-(5,48)
(5,32)-(5,54)
(5,39)-(5,40)
(5,39)-(5,48)
(5,45)-(5,48)
*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,34)-(3,40)
(3,34)-(3,47)
(3,42)-(3,43)
(3,42)-(3,47)
(5,22)-(5,28)
(5,22)-(5,54)
(5,32)-(5,48)
(5,32)-(5,54)
*)
