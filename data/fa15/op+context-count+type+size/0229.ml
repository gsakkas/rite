
let rec wwhile (f,b) =
  match f b with | (h,true ) -> wwhile (f, h) | (h,false ) -> h;;

let fixpoint (f,b) =
  wwhile
    (let func b = match f b with | b -> (b, false) | x -> (x, true) in
     ((func b), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (h,true ) -> wwhile (f, h) | (h,false ) -> h;;

let fixpoint (f,b) =
  wwhile
    (let g x = match f x with | x -> (x, false) | y -> (y, true) in (g, b));;

*)

(* changed spans
(7,4)-(8,19)
(7,14)-(7,67)
(7,18)-(7,67)
(7,24)-(7,27)
(7,26)-(7,27)
(7,41)-(7,42)
(7,59)-(7,60)
(8,6)-(8,14)
(8,7)-(8,11)
(8,12)-(8,13)
*)

(* type error slice
(3,8)-(3,9)
(3,8)-(3,11)
(3,32)-(3,38)
(3,32)-(3,45)
(3,39)-(3,45)
(3,40)-(3,41)
(6,2)-(6,8)
(6,2)-(8,19)
(7,4)-(8,19)
(7,4)-(8,19)
(7,14)-(7,67)
(7,18)-(7,67)
(7,40)-(7,50)
(8,5)-(8,18)
(8,6)-(8,14)
(8,7)-(8,11)
*)
