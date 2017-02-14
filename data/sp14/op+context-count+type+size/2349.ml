
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
(6,12)-(6,68)
(6,24)-(6,27)
(6,26)-(6,27)
(6,32)-(6,68)
(6,37)-(6,43)
(6,37)-(6,68)
(6,50)-(6,51)
(6,50)-(6,54)
(6,50)-(6,68)
(6,53)-(6,54)
(6,60)-(6,68)
*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,33)-(3,39)
(3,33)-(3,45)
(3,41)-(3,42)
(3,41)-(3,45)
(6,3)-(6,9)
(6,3)-(6,77)
(6,12)-(6,68)
(6,12)-(6,77)
(6,32)-(6,68)
*)
