
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> [(mulByDigit i t) ((h * i) mod 10)];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> List.append (mulByDigit i t) [h * i];;

*)

(* changed spans
(5,12)-(5,47)
(5,13)-(5,46)
(5,14)-(5,24)
(5,30)-(5,46)
(5,43)-(5,45)
*)

(* type error slice
(2,3)-(5,49)
(2,19)-(5,47)
(2,21)-(5,47)
(3,2)-(5,47)
(5,12)-(5,47)
(5,13)-(5,29)
(5,13)-(5,46)
(5,14)-(5,24)
*)
