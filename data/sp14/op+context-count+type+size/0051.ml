
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::m::t ->
      ((mulByDigit i m) :: t) @
        [((h * i) / 10) + ((m * i) mod 10); (h * i) mod 10];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::m::t ->
      (mulByDigit i (m :: t)) @
        [((h * i) / 10) + ((m * i) mod 10); (h * i) mod 10];;

*)

(* changed spans
(6,9)-(6,29)
(6,22)-(6,23)
*)

(* type error slice
(2,4)-(7,62)
(2,20)-(7,60)
(2,22)-(7,60)
(3,3)-(7,60)
(6,9)-(6,19)
(6,9)-(6,23)
(6,9)-(6,29)
(6,9)-(6,29)
(6,9)-(7,60)
(6,31)-(6,32)
*)
