
let rec mulByDigit i l =
  match l with | [] -> [] | hd::tl -> [hd * i] @ [mulByDigit i tl];;


(* fix

let rec mulByDigit i l =
  match l with | [] -> [] | hd::tl -> [hd * i] @ (mulByDigit i tl);;

*)

(* changed spans
(3,50)-(3,67)
mulByDigit i tl
AppG (fromList [VarG])

*)

(* type error slice
(2,4)-(3,69)
(2,20)-(3,67)
(2,22)-(3,67)
(3,3)-(3,67)
(3,39)-(3,67)
(3,48)-(3,49)
(3,50)-(3,67)
(3,51)-(3,61)
(3,51)-(3,66)
*)
