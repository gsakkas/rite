
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      helper h;;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      helper [] h;;

*)

(* changed spans
(8,6)-(8,14)
(8,13)-(8,14)
*)

(* type error slice
(3,2)-(8,14)
(3,2)-(8,14)
(4,10)-(4,12)
(6,6)-(8,14)
(7,31)-(7,37)
(7,31)-(7,66)
(8,6)-(8,12)
(8,6)-(8,14)
*)
