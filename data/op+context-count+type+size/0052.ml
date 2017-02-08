
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
(3,3)-(7,60)
*)

(* type error slice
(3,3)-(7,60)
(3,3)-(7,60)
(3,3)-(7,60)
(3,3)-(7,60)
(3,3)-(7,60)
(7,12)-(7,13)
(7,12)-(7,17)
*)
