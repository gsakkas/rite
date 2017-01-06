
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> [mulByDigit i (List.rev l); h * i];;



let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> (mulByDigit i (List.rev l)) @ [h * i];;


(* changed spans
(5,13)-(5,14)
(5,39)-(5,40)
*)

(* type error slice
(3,9)-(3,19)
*)
