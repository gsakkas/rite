
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
(2,4)-(7,62)
(2,20)-(7,60)
(2,22)-(7,60)
(3,3)-(7,60)
(3,9)-(3,17)
(3,9)-(3,19)
(3,18)-(3,19)
(4,15)-(4,17)
(6,8)-(6,18)
(6,8)-(6,28)
(6,19)-(6,20)
(6,22)-(6,28)
(7,12)-(7,17)
(7,16)-(7,17)
*)
