
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> [mulByDigit i (List.rev l); h * i];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> (mulByDigit i (List.rev l)) @ [h * i];;

*)

(* changed spans
(5,12)-(5,46)
(5,13)-(5,23)
(5,40)-(5,45)
*)

(* type error slice
(2,3)-(5,48)
(2,19)-(5,46)
(2,21)-(5,46)
(3,2)-(5,46)
(5,12)-(5,46)
(5,12)-(5,46)
(5,13)-(5,23)
(5,13)-(5,38)
*)
