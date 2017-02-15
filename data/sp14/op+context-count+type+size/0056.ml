
let rec mulByDigit i l =
  match List.rev l with
  | [] -> 0
  | h::t ->
      let rec helper acc v =
        if v = 0 then 0 :: acc else helper ((v mod 10) :: acc) (v / 10) in
      (helper ((mulByDigit i (List.rev t)) * 10)) + (h * i);;


(* fix

let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      helper [] h;;

*)

(* changed spans
(3,8)-(3,16)
(3,8)-(3,18)
(4,10)-(4,11)
(7,22)-(7,23)
(7,22)-(7,30)
(8,6)-(8,49)
(8,6)-(8,59)
*)

(* type error slice
(7,36)-(7,42)
(7,36)-(7,71)
(7,43)-(7,62)
(8,6)-(8,49)
(8,7)-(8,13)
(8,14)-(8,48)
*)
