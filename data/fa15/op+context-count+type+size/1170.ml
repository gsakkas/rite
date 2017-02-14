
let rec mulByDigit i l =
  match l with | [] -> [] | hd::tl -> (mulByDigit i tl) @ ([hd] * i);;


(* fix

let rec mulByDigit i l =
  match l with | [] -> [] | hd::tl -> (mulByDigit i tl) @ [hd * i];;

*)

(* changed spans
(3,60)-(3,68)
(3,61)-(3,63)
*)

(* type error slice
(3,40)-(3,68)
(3,57)-(3,58)
(3,60)-(3,64)
(3,60)-(3,68)
(3,60)-(3,68)
*)
