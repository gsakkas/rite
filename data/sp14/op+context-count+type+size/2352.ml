
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
(7,5)-(8,77)
(7,18)-(7,21)
(7,20)-(7,21)
(8,6)-(8,76)
(8,9)-(8,17)
(8,9)-(8,31)
(8,15)-(8,16)
(8,21)-(8,31)
(8,22)-(8,23)
(8,26)-(8,30)
(8,38)-(8,39)
(8,41)-(8,45)
(8,52)-(8,76)
*)

(* type error slice
(3,8)-(3,9)
(3,8)-(3,11)
(3,32)-(3,38)
(3,32)-(3,45)
(3,39)-(3,45)
(3,40)-(3,41)
(6,2)-(6,8)
(6,2)-(9,8)
(7,4)-(9,8)
(7,5)-(8,77)
(8,6)-(8,76)
(8,52)-(8,76)
(8,52)-(8,76)
(8,52)-(8,76)
(8,66)-(8,76)
*)
