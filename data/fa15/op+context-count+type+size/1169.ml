
let rec mulByDigit i l =
  match l with | [] -> [] | 0 -> [] | hd::tl -> (mulByDigit i tl) @ (hd * i);;


(* fix

let rec mulByDigit i l =
  match l with | [] -> [] | hd::tl -> (mulByDigit i tl) @ [hd * i];;

*)

(* changed spans
(3,3)-(3,76)
(3,34)-(3,36)
(3,70)-(3,76)
*)

(* type error slice
(3,3)-(3,76)
(3,3)-(3,76)
(3,3)-(3,76)
(3,3)-(3,76)
(3,50)-(3,76)
(3,67)-(3,68)
(3,70)-(3,76)
*)
