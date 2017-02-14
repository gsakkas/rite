
let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else (helper (v mod 10)) :: (acc (v / 10)) in
      helper [] h;;


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
(7,33)-(7,49)
(7,33)-(7,67)
(7,41)-(7,49)
(7,56)-(7,67)
*)

(* type error slice
(6,7)-(8,18)
(6,22)-(7,67)
(7,9)-(7,67)
(7,9)-(7,67)
(7,23)-(7,26)
(7,33)-(7,39)
(7,33)-(7,49)
(7,33)-(7,67)
(7,41)-(7,49)
(7,56)-(7,59)
(7,56)-(7,67)
(8,7)-(8,13)
(8,7)-(8,18)
(8,14)-(8,16)
*)
