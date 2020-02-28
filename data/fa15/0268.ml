
let rec mulByDigit i l =
  match l with | [] -> [] | hd::tl -> (hd * i) @ [mulByDigit i tl];;


(* fix

let rec mulByDigit i l =
  match l with | [] -> [] | hd::tl -> [hd * i] @ (mulByDigit i tl);;

*)

(* changed spans
(3,39)-(3,47)
[hd * i]
ListG [BopG EmptyG EmptyG]

(3,50)-(3,67)
mulByDigit i tl
AppG [VarG,VarG]

*)

(* type error slice
(3,39)-(3,47)
(3,39)-(3,67)
(3,48)-(3,49)
*)
