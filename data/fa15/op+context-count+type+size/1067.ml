
let rec mulByDigit i l =
  match l with | [] -> [] | hd::tl -> (hd * i) @ [mulByDigit i tl];;


(* fix

let rec mulByDigit i l =
  match l with | [] -> [] | hd::tl -> [hd * i] @ (mulByDigit i tl);;

*)

(* changed spans
(3,38)-(3,46)
(3,49)-(3,66)
*)

(* type error slice
(3,38)-(3,46)
(3,38)-(3,66)
(3,47)-(3,48)
*)
