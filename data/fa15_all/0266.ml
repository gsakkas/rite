
let rec mulByDigit i l =
  match l with | [] -> [] | hd::tl -> (mulByDigit i tl) @ (hd * i);;


(* fix

let rec mulByDigit i l =
  match l with | [] -> [] | hd::tl -> (mulByDigit i tl) @ [hd * i];;

*)

(* changed spans
(3,59)-(3,67)
[hd * i]
ListG (fromList [BopG EmptyG EmptyG])

*)

(* type error slice
(3,39)-(3,67)
(3,57)-(3,58)
(3,59)-(3,67)
*)
