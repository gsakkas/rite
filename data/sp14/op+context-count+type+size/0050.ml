
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::m::t ->
      ((mulByDigit m) :: t) @
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
(6,9)-(6,21)
(6,9)-(6,27)
(6,20)-(6,21)
*)

(* type error slice
(2,4)-(7,62)
(2,20)-(7,60)
(2,22)-(7,60)
(3,3)-(7,60)
(6,9)-(6,19)
(6,9)-(6,21)
(6,9)-(6,27)
(6,9)-(6,27)
(6,9)-(7,60)
(6,29)-(6,30)
*)
