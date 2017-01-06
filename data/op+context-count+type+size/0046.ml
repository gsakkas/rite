
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> ((h * i) mod 10) :: (((h * i) / 10) + h);;



let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> [(h * i) mod 10; ((h * i) / 10) + h];;


(* changed spans
(5,13)-(5,14)
(5,28)-(5,34)
(5,52)-(5,53)
*)

(* type error slice
(3,9)-(3,19)
*)
