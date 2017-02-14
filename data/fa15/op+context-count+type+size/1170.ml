
let rec mulByDigit i l =
  match l with | [] -> [] | hd::tl -> (mulByDigit i tl) @ ([hd] * i);;


(* fix

let rec mulByDigit i l =
  match l with | [] -> [] | hd::tl -> (mulByDigit i tl) @ [hd * i];;

*)

(* changed spans
(3,58)-(3,68)
(3,60)-(3,62)
*)

(* type error slice
(3,38)-(3,68)
(3,56)-(3,57)
(3,58)-(3,68)
(3,58)-(3,68)
(3,59)-(3,63)
*)
