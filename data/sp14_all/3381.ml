
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
(8,7)-(8,15)
helper [] h
AppG (fromList [VarG,ListG (fromList [])])

*)

(* type error slice
(3,3)-(8,15)
(4,11)-(4,13)
(6,7)-(8,15)
(7,32)-(7,38)
(7,32)-(7,67)
(8,7)-(8,13)
(8,7)-(8,15)
*)
