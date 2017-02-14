
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> ((mulByDigit i (List.rev t)) * 10) @ [h * i];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> (mulByDigit i (List.rev t)) @ [h * i];;

*)

(* changed spans
(5,12)-(5,46)
(5,43)-(5,45)
*)

(* type error slice
(2,3)-(5,58)
(2,19)-(5,56)
(2,21)-(5,56)
(3,2)-(5,56)
(4,10)-(4,12)
(5,12)-(5,46)
(5,12)-(5,46)
(5,12)-(5,56)
(5,13)-(5,40)
(5,14)-(5,24)
(5,47)-(5,48)
*)
