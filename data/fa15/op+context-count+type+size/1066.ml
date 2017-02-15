
let rec mulByDigit i l =
  match l with | [] -> [] | hd::tl -> [hd * i] @ [mulByDigit i tl];;


(* fix

let rec mulByDigit i l =
  match l with | [] -> [] | hd::tl -> [hd * i] @ (mulByDigit i tl);;

*)

(* changed spans
(3,49)-(3,66)
*)

(* type error slice
(2,3)-(3,68)
(2,19)-(3,66)
(2,21)-(3,66)
(3,2)-(3,66)
(3,38)-(3,66)
(3,47)-(3,48)
(3,49)-(3,66)
(3,49)-(3,66)
(3,50)-(3,60)
(3,50)-(3,65)
*)
