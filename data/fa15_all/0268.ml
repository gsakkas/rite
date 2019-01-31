
let rec mulByDigit i l =
  match l with | [] -> [] | hd::tl -> (hd * i) @ [mulByDigit i tl];;


(* fix

let rec mulByDigit i l =
  match l with | [] -> [] | hd::tl -> [hd * i] @ (mulByDigit i tl);;

*)

(* changed spans
(3,38)-(3,46)
[hd * i]
ListG (BopG EmptyG EmptyG) Nothing

*)
