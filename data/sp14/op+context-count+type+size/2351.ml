
let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

let fixpoint (f,b) = wwhile ((let (x,y) = f b in (x, (x != b))), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

let fixpoint (f,b) =
  wwhile ((let a x = let xx = f x in (xx, (x <> b)) in a), b);;

*)

(* changed spans
(5,31)-(5,61)
(5,43)-(5,46)
(5,45)-(5,46)
(5,51)-(5,61)
(5,55)-(5,61)
(5,66)-(5,67)
*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,33)-(3,39)
(3,33)-(3,45)
(3,41)-(3,42)
(3,41)-(3,45)
(5,22)-(5,28)
(5,22)-(5,67)
(5,31)-(5,61)
(5,31)-(5,67)
(5,51)-(5,61)
*)
