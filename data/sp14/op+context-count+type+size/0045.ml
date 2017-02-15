
let rec mulByDigit i l =
  match List.rev l with
  | []::[] -> []
  | h::m::t ->
      (mulByDigit i (m :: t)) @
        [((h * i) / 10) + ((m * i) mod 10); (h * i) mod 10];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | _::[] -> []
  | h::m::t ->
      (mulByDigit i (m :: t)) @
        [((h * i) / 10) + ((m * i) mod 10); (h * i) mod 10];;

*)

(* changed spans
(3,2)-(7,59)
*)

(* type error slice
(3,2)-(7,59)
(3,2)-(7,59)
(3,2)-(7,59)
(3,2)-(7,59)
(3,2)-(7,59)
(7,10)-(7,17)
(7,11)-(7,12)
*)
