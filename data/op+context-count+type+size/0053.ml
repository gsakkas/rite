
let rec mulByDigit i l =
  match List.rev l with
  | []::[] -> []
  | h::m::t ->
      (mulByDigit i (m :: t)) @
        [((h * i) / 10) + ((m * i) mod 10); (h * i) mod 10];;



let rec mulByDigit i l =
  match List.rev l with
  | _::[] -> []
  | h::m::t ->
      (mulByDigit i (m :: t)) @
        [((h * i) / 10) + ((m * i) mod 10); (h * i) mod 10];;


(* changed spans
(4,5)-(4,7)
*)

(* type error slice
(3,9)-(3,19)
*)
