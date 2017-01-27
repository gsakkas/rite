
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
(2,50)-(2,55)
(2,50)-(2,64)
(2,56)-(2,57)
(2,59)-(2,64)
(5,3)-(7,69)
(5,15)-(5,26)
(5,15)-(5,29)
(5,27)-(5,29)
(6,3)-(7,69)
(6,15)-(6,26)
(6,15)-(6,29)
(6,27)-(6,29)
(7,7)-(7,12)
(7,7)-(7,20)
(7,7)-(7,29)
(7,7)-(7,35)
(7,13)-(7,14)
(7,15)-(7,20)
(7,31)-(7,32)
(7,33)-(7,35)
(7,41)-(7,46)
(7,41)-(7,54)
(7,41)-(7,63)
(7,41)-(7,69)
(7,47)-(7,48)
(7,49)-(7,54)
(7,65)-(7,66)
(7,67)-(7,69)
*)
