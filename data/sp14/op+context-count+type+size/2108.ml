
let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

let fixpoint (f,b) =
  wwhile ((let (x,y) = f b in (x, ((x <> b) && ((x, y) <> (f (b - 1)))))), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

let fixpoint (f,b) =
  wwhile ((let a x = let xx = f x in (xx, (x <> b)) in a), b);;

*)

(* changed spans
(6,10)-(6,73)
(6,23)-(6,26)
(6,25)-(6,26)
(6,30)-(6,72)
(6,34)-(6,71)
(6,35)-(6,43)
(6,47)-(6,70)
(6,48)-(6,54)
(6,49)-(6,50)
(6,52)-(6,53)
(6,58)-(6,69)
*)

(* type error slice
(3,8)-(3,9)
(3,8)-(3,11)
(3,32)-(3,38)
(3,32)-(3,45)
(3,39)-(3,45)
(3,40)-(3,41)
(6,2)-(6,8)
(6,2)-(6,77)
(6,9)-(6,77)
(6,10)-(6,73)
(6,30)-(6,72)
*)
