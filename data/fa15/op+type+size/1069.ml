
let retHead l = match l with | [] -> [] | h::t -> h;;

let rec mulByDigit i l =
  match l with
  | [] -> []
  | hd::tl ->
      [((hd * i) mod 10) + (((retHead tl) * i) / 10)] @ (mulByDigit i tl);;


(* fix

let rec mulByDigit i l =
  match l with | [] -> [] | hd::tl -> [(hd * i) mod 10] @ (mulByDigit i tl);;

*)

(* changed spans
(2,12)-(2,51)
(2,16)-(2,51)
(2,22)-(2,23)
(2,37)-(2,39)
(2,50)-(2,51)
(8,7)-(8,52)
(8,27)-(8,52)
(8,29)-(8,41)
*)

(* type error slice
(2,3)-(2,53)
(2,12)-(2,51)
(2,16)-(2,51)
(2,16)-(2,51)
(2,16)-(2,51)
(2,16)-(2,51)
(2,22)-(2,23)
(2,37)-(2,39)
(2,50)-(2,51)
(5,2)-(8,73)
(5,2)-(8,73)
(8,8)-(8,16)
(8,9)-(8,11)
(8,29)-(8,41)
(8,30)-(8,37)
(8,38)-(8,40)
*)

(* all spans
(2,12)-(2,51)
(2,16)-(2,51)
(2,22)-(2,23)
(2,37)-(2,39)
(2,50)-(2,51)
(4,19)-(8,73)
(4,21)-(8,73)
(5,2)-(8,73)
(5,8)-(5,9)
(6,10)-(6,12)
(8,6)-(8,73)
(8,54)-(8,55)
(8,6)-(8,53)
(8,7)-(8,52)
(8,7)-(8,24)
(8,8)-(8,16)
(8,9)-(8,11)
(8,14)-(8,15)
(8,21)-(8,23)
(8,27)-(8,52)
(8,28)-(8,46)
(8,29)-(8,41)
(8,30)-(8,37)
(8,38)-(8,40)
(8,44)-(8,45)
(8,49)-(8,51)
(8,56)-(8,73)
(8,57)-(8,67)
(8,68)-(8,69)
(8,70)-(8,72)
*)
