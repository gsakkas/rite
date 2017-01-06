
let rec mulByDigit i l =
  match List.rev l with
  | [] -> 0
  | h::t -> [((h * i) / 10) + (mulByDigit i t); (h * i) mod 10];;



let rec mulByDigit i l =
  match List.rev l with | [] -> [] | h::t -> [(h * i) mod 10];;


(* changed spans
(4,11)-(4,12)
(5,15)-(5,16)
(5,23)-(5,56)
*)

(* type error slice
(3,9)-(3,19)
*)
