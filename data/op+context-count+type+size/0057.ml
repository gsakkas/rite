
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> ((mulByDigit i (List.rev t)) * 10) @ [h * i];;



let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> (mulByDigit i (List.rev t)) @ [h * i];;


(* changed spans
(5,14)-(5,15)
(5,42)-(5,47)
*)

(* type error slice
(3,9)-(3,19)
*)
