
let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

let fixpoint (f,b) =
  wwhile
    ((let (x,y) = f b in
      if (x <> b) && (y = true) then (x, true) else if x = b then (x, false)),
      b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

let fixpoint (f,b) =
  wwhile ((let a x = let xx = f x in (xx, (x <> b)) in a), b);;

*)

(* changed spans
(7,7)-(8,76)
(7,19)-(7,22)
(7,21)-(7,22)
(8,7)-(8,76)
(8,11)-(8,17)
(8,11)-(8,31)
(8,16)-(8,17)
(8,23)-(8,24)
(8,23)-(8,31)
(8,27)-(8,31)
(8,39)-(8,40)
(8,42)-(8,46)
(8,53)-(8,76)
*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,33)-(3,39)
(3,33)-(3,45)
(3,41)-(3,42)
(3,41)-(3,45)
(6,3)-(6,9)
(6,3)-(9,8)
(7,7)-(8,76)
(7,7)-(9,8)
(8,7)-(8,76)
(8,53)-(8,76)
(8,53)-(8,76)
(8,53)-(8,76)
(8,68)-(8,76)
*)
