
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
(6,10)-(6,56)
(6,23)-(6,26)
(6,25)-(6,26)
(6,30)-(6,55)
(6,34)-(6,54)
(6,35)-(6,42)
(6,36)-(6,37)
(6,40)-(6,41)
(6,46)-(6,53)
(6,47)-(6,48)
(6,58)-(6,59)
*)

(* type error slice
(3,8)-(3,9)
(3,8)-(3,11)
(3,32)-(3,38)
(3,32)-(3,45)
(3,39)-(3,45)
(3,40)-(3,41)
(6,2)-(6,8)
(6,2)-(6,60)
(6,9)-(6,60)
(6,10)-(6,56)
(6,30)-(6,55)
*)
