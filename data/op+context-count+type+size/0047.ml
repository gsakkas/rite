
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> [(mulByDigit i t) ((h * i) mod 10)];;



let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> List.append (mulByDigit i t) [h * i];;


(* changed spans
(5,13)-(5,14)
(5,31)-(5,33)
(5,38)-(5,47)
*)

(* type error slice
(3,9)-(3,19)
*)
