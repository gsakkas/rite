
let rec mulByDigit i l =
  match l with | [] -> [] | hd::tl -> (mulByDigit i tl) @ (hd * i);;


(* fix

let rec mulByDigit i l =
  match l with | [] -> [] | hd::tl -> (mulByDigit i tl) @ [hd * i];;

*)

(* changed spans
(3,58)-(3,66)
*)

(* type error slice
(3,38)-(3,66)
(3,56)-(3,57)
(3,58)-(3,66)
*)

(* all spans
(2,19)-(3,66)
(2,21)-(3,66)
(3,2)-(3,66)
(3,8)-(3,9)
(3,23)-(3,25)
(3,38)-(3,66)
(3,56)-(3,57)
(3,38)-(3,55)
(3,39)-(3,49)
(3,50)-(3,51)
(3,52)-(3,54)
(3,58)-(3,66)
(3,59)-(3,61)
(3,64)-(3,65)
*)
