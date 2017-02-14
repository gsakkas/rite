
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
(7,6)-(8,18)
(7,15)-(7,67)
(7,19)-(7,67)
(7,25)-(7,28)
(7,27)-(7,28)
(7,42)-(7,43)
(7,60)-(7,61)
(8,8)-(8,12)
(8,8)-(8,14)
(8,13)-(8,14)
*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,33)-(3,39)
(3,33)-(3,45)
(3,41)-(3,42)
(3,41)-(3,45)
(6,3)-(6,9)
(6,3)-(8,18)
(7,6)-(8,18)
(7,6)-(8,18)
(7,15)-(7,67)
(7,19)-(7,67)
(7,42)-(7,50)
(8,8)-(8,12)
(8,8)-(8,14)
(8,8)-(8,18)
*)
