
let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

let fixpoint (f,b) =
  wwhile
    ((let f f b =
        if ((f b) = (b, true)) && ((b, true) = (f (b - 1))) then (b, false) in
      f), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

let fixpoint (f,b) =
  wwhile ((let a x = let xx = f x in (xx, (x <> b)) in a), b);;

*)

(* changed spans
(7,7)-(9,8)
(7,13)-(8,75)
(7,15)-(8,75)
(8,9)-(8,75)
(8,14)-(8,17)
(8,14)-(8,29)
(8,14)-(8,57)
(8,16)-(8,17)
(8,22)-(8,23)
(8,25)-(8,29)
(8,37)-(8,44)
(8,37)-(8,57)
(8,49)-(8,57)
(8,67)-(8,75)
(9,7)-(9,8)
*)

(* type error slice
(3,3)-(3,64)
(3,9)-(3,10)
(3,9)-(3,12)
(3,33)-(3,39)
(3,33)-(3,45)
(3,41)-(3,42)
(3,41)-(3,45)
(6,3)-(6,9)
(6,3)-(9,12)
(7,7)-(9,8)
(7,7)-(9,8)
(7,7)-(9,12)
(7,13)-(8,75)
(7,15)-(8,75)
(8,9)-(8,75)
(8,9)-(8,75)
(8,9)-(8,75)
(8,67)-(8,75)
(9,7)-(9,8)
*)
