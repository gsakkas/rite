
let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

let fixpoint (f,b) =
  wwhile ((let (x,y) = f b in (x, ((x > b) || (x < b)))), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

let fixpoint (f,b) =
  wwhile ((let a x = let xx = f x in (xx, (x <> b)) in a), b);;

*)

(* changed spans
(6,12)-(6,53)
(6,24)-(6,27)
(6,26)-(6,27)
(6,32)-(6,53)
(6,37)-(6,38)
(6,37)-(6,42)
(6,37)-(6,53)
(6,41)-(6,42)
(6,48)-(6,49)
(6,48)-(6,53)
(6,59)-(6,60)
*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,33)-(3,39)
(3,33)-(3,45)
(3,41)-(3,42)
(3,41)-(3,45)
(6,3)-(6,9)
(6,3)-(6,60)
(6,12)-(6,53)
(6,12)-(6,60)
(6,32)-(6,53)
*)
