
let rec mulByDigit i l =
  match l with | [] -> [] | hd::tl -> (mulByDigit i tl) @ (hd * i);;


(* fix

let rec mulByDigit i l =
  match l with | [] -> [] | hd::tl -> (mulByDigit i tl) @ [hd * i];;

*)

(* changed spans
(3,60)-(3,66)
*)

(* type error slice
(3,40)-(3,66)
(3,57)-(3,58)
(3,60)-(3,66)
*)
