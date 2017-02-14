
let rec retHead l = match l with | [] -> [] | h::t -> h;;

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
(2,16)-(2,55)
(2,20)-(2,55)
(2,26)-(2,27)
(2,41)-(2,43)
(2,54)-(2,55)
(8,7)-(8,52)
(8,27)-(8,52)
*)

(* type error slice
(2,3)-(2,57)
(2,16)-(2,55)
(2,20)-(2,55)
(2,20)-(2,55)
(2,20)-(2,55)
(2,20)-(2,55)
(2,26)-(2,27)
(2,41)-(2,43)
(2,54)-(2,55)
(5,2)-(8,73)
(5,2)-(8,73)
(8,8)-(8,16)
(8,9)-(8,11)
(8,29)-(8,41)
(8,30)-(8,37)
(8,38)-(8,40)
*)
