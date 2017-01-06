
let rec mulByDigit i l =
  match List.rev l with | [] -> [] | h::t -> [mulByDigit i t; (h * i) mod 10];;



let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> List.append (mulByDigit i t) [(h * i) mod 10];;


(* changed spans
(3,46)-(3,47)
(3,61)-(3,62)
*)

(* type error slice
(3,9)-(3,19)
*)
