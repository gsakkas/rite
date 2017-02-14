
let rec mulByDigit i l =
  match l with | [] -> [] | hd::tl -> (hd * i) @ [mulByDigit i tl];;


(* fix

let rec mulByDigit i l =
  match l with | [] -> [] | hd::tl -> [hd * i] @ (mulByDigit i tl);;

*)

(* changed spans
(3,40)-(3,46)
(3,50)-(3,67)
*)

(* type error slice
(3,40)-(3,46)
(3,40)-(3,67)
(3,48)-(3,49)
*)
