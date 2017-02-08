
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let leng1 = List.length l1 in
  let leng2 = List.length l2 in
  ((((clone 0 leng1) - leng2) @ l1), (((clone 0 leng2) - leng1) @ l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let leng1 = List.length l1 in
  let leng2 = List.length l2 in
  (((clone 0 (leng1 - leng2)) @ l1), ((clone 0 (leng2 - leng1)) @ l2));;

*)

(* changed spans
(7,7)-(7,29)
(7,15)-(7,20)
(7,41)-(7,63)
(7,49)-(7,54)
*)

(* type error slice
(2,44)-(2,64)
(2,50)-(2,55)
(2,50)-(2,64)
(7,7)-(7,12)
(7,7)-(7,20)
(7,7)-(7,29)
(7,7)-(7,29)
(7,7)-(7,35)
(7,31)-(7,32)
(7,41)-(7,46)
(7,41)-(7,54)
(7,41)-(7,63)
(7,41)-(7,63)
(7,41)-(7,69)
(7,65)-(7,66)
*)
