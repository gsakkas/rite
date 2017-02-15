
let rec mulByDigit i l =
  match l with | [] -> [] | 0 -> [] | hd::tl -> (mulByDigit i tl) @ (hd * i);;


(* fix

let rec mulByDigit i l =
  match l with | [] -> [] | hd::tl -> (mulByDigit i tl) @ [hd * i];;

*)

(* changed spans
(3,2)-(3,76)
(3,33)-(3,35)
(3,68)-(3,76)
*)

(* type error slice
(3,2)-(3,76)
(3,2)-(3,76)
(3,2)-(3,76)
(3,2)-(3,76)
(3,48)-(3,76)
(3,66)-(3,67)
(3,68)-(3,76)
*)
